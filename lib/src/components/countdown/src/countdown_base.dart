library countdown.base;

import 'dart:async';

class CountDown {

  /// once you instantiate the CountDown you need to register to receive information
  CountDown(
    Duration duration,
    {
      Duration refresh = const Duration(milliseconds: 10),
      int everyTick = 1
    }
  ) {
    _refresh = refresh;
    _everyTick = everyTick;

    _duration = duration;
    _controller = StreamController<Duration>(
      onListen: _onListen,
      onPause: _onPause,
      onResume: _onResume,
      onCancel: _onCancel
    );
  }
  
  /// reference point for start and resume
  DateTime _begin;
  Timer _timer;
  Duration _duration;
  Duration remainingTime;
  bool isPaused = false;
  StreamController<Duration> _controller;
  Duration _refresh;

  /// provide a way to send less data to the client but keep the data of the timer up to date
  int _everyTick, counter = 0;

  Stream<Duration> get stream => _controller.stream;

  /// _onListen
  /// invoke when the first subscriber has subscribe and not before to avoid leak of memory
  void _onListen() {
    // reference point
    _begin = DateTime.now();
    _timer = Timer.periodic(_refresh, _tick);
  }

  /// the remaining time is set at '_refresh' ms accurate
  void _onPause() {
    isPaused = true;
    _timer.cancel();
    _timer = null;
  }

  /// ...restart the timer with the duration
  void _onResume() {
    _begin = DateTime.now();

    _duration = remainingTime;
    isPaused = false;

    //  lance le timer
    _timer = Timer.periodic(_refresh, _tick);
  }

  void _onCancel() {
    // on pause we already cancel the _timer
    if (!isPaused) {
      _timer.cancel();
      _timer = null;
    }
    // _controller.close(); // close automatically the "pipe" when the sub close it by sub.cancel()
  }

  void _tick(Timer timer) {
    counter++;
    final Duration alreadyConsumed = DateTime.now().difference(_begin);
    remainingTime = _duration - alreadyConsumed;
    if (remainingTime.isNegative) {
      timer.cancel();
      timer = null;
      // tell the onDone's subscriber that it's finish
      _controller.close();
    } else {
      // here we can control the frequency of sending data
      if (counter % _everyTick == 0) {
        _controller.add(remainingTime);
        counter = 0;
      }
    }
  }

}