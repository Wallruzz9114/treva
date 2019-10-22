import 'package:flutter/material.dart';
import 'package:treva/src/components/shared/custom_bottom_navigation_bar.dart';

/// Componen Login Animation to set Animation in login like a bounce ball to fullscreen
class LogInAnimation extends StatefulWidget {

  LogInAnimation({ Key key, this.animationController }) :
    animation = Tween<double>(
      end: 900.0,
      begin: 70.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut
      )
    ), super(key:key);

  final AnimationController animationController;
  final Animation<dynamic> animation;

  /// Setting shape a animation
  Widget _buildAnimation(BuildContext context, Widget child) => Padding(
    padding: const EdgeInsets.only(bottom: 60.0),
    child: Container(
      height: animation.value,
      width: animation.value,
      decoration: BoxDecoration(
        color: const Color(0xFF3B2E6F),
        shape: animation.value < 600 ? BoxShape.circle :BoxShape.rectangle,
      ),
    ),
  );

  @override
  _LogInAnimationState createState() => _LogInAnimationState();

}

class _LogInAnimationState extends State<LogInAnimation> {

  @override
  Widget build(BuildContext context) {
    /// To navigation after animation complete
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        Navigator.of(context).pushReplacement<dynamic, dynamic>(
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => CustomBottomNavigationBar()
          )
        );
      }
    });

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }

}