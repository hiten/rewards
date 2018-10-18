import 'package:flutter/material.dart';
import 'package:rewards/values/dimens.dart';
import 'package:rewards/values/strings.dart';
import 'package:rewards/features/login/LoginScreen.dart';
import 'package:rewards/features/signup/SignupScreen.dart';

class SplashScreen extends StatelessWidget {
  final _buttonStyle =
      TextStyle(color: Colors.black87, fontWeight: FontWeight.bold);

  final _buttonBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      side: BorderSide(
        color: Colors.black87,
        width: 2.0,
        style: BorderStyle.solid,
      ));

  Widget _getAuthButton(String label, VoidCallback onPressed) {
    return FlatButton(
      child: Text(
        label,
        textDirection: TextDirection.ltr,
        style: _buttonStyle,
      ),
      shape: _buttonBorder,
      padding: EdgeInsets.all(16.0),
      onPressed: onPressed,
    );
  }

  List<Widget> _getAuthButtonBar(BuildContext context) {
    return [
      _getAuthButton(StringConstants.LABEL_LOGIN, () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new LoginScreen();
        }));
      }),
      _getAuthButton(StringConstants.LABEL_SIGN_UP, () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new SignupScreen();
        }));
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow,
      body: Stack(children: <Widget>[
        // Logo widget
        Center(
          child: Text(
            "Reward's",
            textScaleFactor: 2.0,
            textDirection: TextDirection.ltr,
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),

        Positioned(
          bottom: Dimens.MARGIN_32,
          left: Dimens.MARGIN_16,
          right: Dimens.MARGIN_16,
          child: Flex(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            direction: Axis.horizontal,
            children: _getAuthButtonBar(context),
          ),
        )
      ]),
    );
  }
}
