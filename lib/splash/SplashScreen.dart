import 'package:flutter/material.dart';
import 'package:rewards/login/LoginScreen.dart';

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

  Widget _getAuthButton(String text, VoidCallback onPressed) {
    return FlatButton(
      child: Text(
        text,
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
      _getAuthButton("Login", () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new LoginScreen();
        }));
      }),
      _getAuthButton("Signup", () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new LoginScreen();
        }));
      })];
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
          bottom: 32.0,
          left: 16.0,
          right: 16.0,
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
