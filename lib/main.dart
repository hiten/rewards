import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:rewards/splash/SplashScreen.dart';
import 'package:rewards/login/LoginScreen.dart';

void main() => runApp(MainWidget());

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.yellow,
        primaryColorDark: Colors.amber,
        accentColor: Colors.black26
      ),
      home: SplashScreen(),
    );
  }
}
