import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treva/src/screens/log_in/log_in_screen.dart';
import 'package:treva/src/components/log_in/log_in_animation.dart';
import 'package:treva/src/components/shared/black_bottom_button.dart';
import 'package:treva/src/components/shared/text_from_field.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> with TickerProviderStateMixin {

  AnimationController animationController;
  AnimationController animationControllerScreen;
  Animation<dynamic> animation;
  int tapCount = 0;

  /// Playanimation set forward reverse
  Future<void> _playAnimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled catch (e) {
      print(e.toString());
    }
  }

  /// Set AnimationController to initState
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800)
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          tapCount = 0;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    mediaQueryData.size.width;
    mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
       body: Stack(
        children: <Widget>[
          Container(
            /// Set Background image in layout
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/img/backgroundgirl.png'),
                fit: BoxFit.cover,
              )
            ),
            child: Container(
              /// Set gradient color in image
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const <Color>[
                    Color.fromRGBO(0, 0, 0, 0.2),
                    Color.fromRGBO(0, 0, 0, 0.3),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),
              /// Set component layout
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: AlignmentDirectional.topCenter,
                            child: Column(
                              children: <Widget>[
                                /// padding logo
                                Padding(
                                  padding: EdgeInsets.only(top: mediaQueryData.padding.top + 40.0),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: const AssetImage('assets/img/Logo.png'),
                                      height: 70.0,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    ),
                                    /// Animation text treva shop accept from login layout
                                    Hero(
                                      tag: 'Treva',
                                      child: Text(
                                        'Treva Shop',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.6,
                                          fontFamily: 'Sans',
                                          color: Colors.white,
                                          fontSize: 20.0
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 70.0),
                                ),
                                /// TextFromField Email
                                const TextFromField(
                                  icon: Icons.email,
                                  password: false,
                                  email: 'Email',
                                  inputType: TextInputType.emailAddress,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                ),
                                /// TextFromField Password
                                const TextFromField(
                                  icon: Icons.vpn_key,
                                  password: true,
                                  email: 'Password',
                                  inputType: TextInputType.text,
                                ),
                                /// Button Login
                                FlatButton(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement<dynamic, dynamic>(
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) => LogInScreen()
                                      )
                                    );
                                  },
                                  child: Text(
                                    'Already have an acount? Log In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Sans'
                                    ),
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: mediaQueryData.padding.top + 175.0,
                                    bottom: 0.0
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      /// Set Animaion after user click buttonLogin
                      tapCount == 0 ? InkWell(
                        splashColor: Colors.yellow,
                        onTap: () {
                          setState(() {
                            tapCount = 1;
                          });
                          _playAnimation();
                          
                          return tapCount;
                        },
                        child: BlackBottomButton(),
                      ) : LogInAnimation(
                        animationController: animationController.view,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  /// Dispose animationController
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

}