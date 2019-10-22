import 'package:flutter/material.dart';
import 'package:treva/src/components/log_in/log_in_animation.dart';
import 'package:treva/src/components/shared/black_bottom_button.dart';
import 'package:treva/src/components/shared/custom_facebook_button.dart';
import 'package:treva/src/components/shared/custom_google_button.dart';
import 'package:treva/src/components/shared/text_from_field.dart';
import 'package:treva/src/screens/sign_up/sign_up_screen.dart';

class LogInScreen extends StatefulWidget {

  @override
  _LogInScreenState createState() => _LogInScreenState();

}

class _LogInScreenState extends State<LogInScreen> with TickerProviderStateMixin {

  AnimationController animationController;
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

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..addStatusListener((AnimationStatus status) {
      if (status ==AnimationStatus.dismissed) {
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
      body: Container(
        /// Set Background image in layout (Click to open code)
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/img/loginscreenbackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          /// Set gradient color in image (Click to open code)
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const <Color>[
                Color.fromRGBO(0, 0, 0, 0.0),
                Color.fromRGBO(0, 0, 0, 0.3)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          /// Set component layout
          child: ListView(
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      /// Padding logo
                      Padding(
                        padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 40.0
                        ),
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
                          /// Animation text treva shop accept from signup layout (Click to open code)
                          Hero(
                            tag: 'Treva',
                            child: Text(
                              'Treva',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.6,
                                color: Colors.white,
                                fontFamily: 'Sans',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                      ),
                      CustomFacebookButton(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.0),
                      ),
                      CustomGoogleButton(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 0.2,
                          fontFamily: 'Sans',
                          fontSize: 17.0
                        ),
                      ),
                      /// TextFromField Email
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      const TextFromField(
                        icon: Icons.email,
                        password: false,
                        email: 'Email',
                        inputType: TextInputType.emailAddress,
                      ),
                      /// TextFromField Password
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0)
                      ),
                      const TextFromField(
                        icon: Icons.vpn_key,
                        password: true,
                        email: 'Password',
                        inputType: TextInputType.text,
                      ),
                      /// Button Sign up
                      FlatButton(
                        padding: const EdgeInsets.only(top: 20.0),
                        onPressed: () {
                          Navigator.of(context).pushReplacement<dynamic, dynamic>(
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => SignUpScreen()
                            )
                          );
                        },
                        child: Text(
                          'No Acount? Sign Up',
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
                          top: mediaQueryData.padding.top + 100.0,
                          bottom: 0.0
                        ),
                      )
                    ],
                  ),
                  /// Set Animaion after user click buttonLogin
                  tapCount == 0 ? InkWell(
                    splashColor: Colors.yellow,
                    onTap: () {
                      setState(() {
                        tapCount = 1;
                      });
                      LogInAnimation(
                        animationController: animationController.view,
                      );
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
    );
  }

  /// Dispose animation controller
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

}