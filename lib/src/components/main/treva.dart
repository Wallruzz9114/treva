import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treva/src/components/main/presentation.dart';
import 'package:treva/src/screens/splash/splash_screen.dart';

class Treva extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    return MaterialApp(
      title: 'Treva',
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColorLight: Colors.white,
        primaryColorBrightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      /// Move splash screen to ChoseLogin Layout
      /// Routes
      routes: <String, WidgetBuilder>{
        'login': (BuildContext context) => Presentation()
      },
    );
  }

}