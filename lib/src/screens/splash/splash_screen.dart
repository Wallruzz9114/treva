import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  /// To navigate layout change
  void _navigatorPage() {
    //Navigator.of(context).pushReplacementNamed('login');
  }

  /// Setting duration in splash screen
  dynamic startTime() async => Timer(Duration(milliseconds: 4500), _navigatorPage);

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in splash screen layout (Click to open code)
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/img/man.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          /// Set gradient black in image splash screen (Click to open code)
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const <Color>[
                Color.fromRGBO(0, 0, 0, 0.3),
                Color.fromRGBO(0, 0, 0, 0.4),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            )
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    /// Text header "Welcome To" (Click to open code)
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Sans',
                        fontSize: 19.0,
                      ),
                    ),
                    /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)
                    Hero(
                      tag: 'Treva',
                      child: Text(
                        'Treva Shop',
                        style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.w900,
                          fontSize: 35.0,
                          letterSpacing: 0.4,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}