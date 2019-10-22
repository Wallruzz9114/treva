import 'package:flutter/material.dart';
import 'package:treva/src/components/shared/log_in_sign_up_choice.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class Presentation extends StatefulWidget {

  @override
  _PresentationState createState() => _PresentationState();

}

class _PresentationState extends State<Presentation> {

  static final TextStyle _fontHeaderStyle = TextStyle(
    fontFamily: 'Popins',
    fontSize: 21.0,
    fontWeight: FontWeight.w800,
    color: Colors.black87,
    letterSpacing: 1.5
  );

  static final TextStyle _fontDescriptionStyle = TextStyle(
    fontFamily: 'Sans',
    fontSize: 15.0,
    color: Colors.black26,
    fontWeight: FontWeight.w400
  );

  ///
  /// Page View Model for on boarding
  ///
  final List<PageViewModel> pages = <PageViewModel>[
    PageViewModel(
      pageColor:  Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'E-Commerce App',
        style: _fontHeaderStyle,
      ),
      body: Text(
        'E commerce application template \nbuy this code template in codecanyon',
        textAlign: TextAlign.center,
        style: _fontDescriptionStyle
      ),
      mainImage: Image.asset(
        'assets/imgIllustration/IlustrasiOnBoarding1.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor:  Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Choose Item',
        style: _fontHeaderStyle,
      ),
      body: Text(
        'Choose Items wherever you are with this application to make life easier',
        textAlign: TextAlign.center,
        style: _fontDescriptionStyle
      ),
      mainImage: Image.asset(
        'assets/imgIllustration/IlustrasiOnBoarding2.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor:  Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Buy Item',style: _fontHeaderStyle,
      ),
      body: Text(
        'Shop from thousand brands in the world \n in one application at throwaway \nprices ',
        textAlign: TextAlign.center,
        style: _fontDescriptionStyle
      ),
      mainImage: Image.asset(
        'assets/imgIllustration/IlustrasiOnBoarding3.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pages,
      pageButtonsColor: Colors.black45,
      skipText: Text(
        'SKIP',
        style: _fontDescriptionStyle.copyWith(
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
        ),
      ),
      doneText: Text(
        'DONE',
        style: _fontDescriptionStyle.copyWith(
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.0,
        ),
      ),
      onTapDoneButton: () {
        Navigator.of(context).pushReplacement<dynamic, dynamic>(
          PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => LogInSignUpChoice(),
            transitionsBuilder: (_, Animation<double> animation, __, Widget widget) {
              return Opacity(
                opacity: animation.value,
                child: widget,
              );
            },
            transitionDuration: const Duration(milliseconds: 1500),
          )
        );
      },
    );
  }

}