import 'package:flutter/material.dart';

class BlackBottomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 0.2,
            fontFamily: 'Sans',
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15.0
            )
          ],
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: const <Color>[
              Color(0xFF121940),
              Color(0xFF6E48AA)
            ]
          ),
        ),
      ),
    );
  }
  
}
