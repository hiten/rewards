import 'package:flutter/material.dart';
import 'package:rewards/shared/FlatButtonWithRoundedBorder.dart';
import 'package:rewards/shared/InputFieldDecoration.dart';
import 'package:rewards/values/strings.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: new SafeArea(
            minimum: EdgeInsets.all(16.0), child: _formLayout(context)));
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _formLayout(BuildContext context) {
    return new Form(
        key: _formKey,
        child: new Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 80.0),
            Text(
              "Reward's",
              textScaleFactor: 2.0,
              textDirection: TextDirection.ltr,
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 80.0),
            TextFormField(
                validator: (emailInput) {
                  if (emailInput.trim().length == 0) {
                    return "Please enter a valid email";
                  }
                },
                controller: _emailController,
                decoration:
                    InputFieldDecoration(StringConstants.LABEL_USERNAME),
                obscureText: false),
            SizedBox(height: 30.0),
            TextFormField(
              validator: (password) {
                if (password.trim().length == 0) {
                  return "Please enter a valid password";
                }
              },
              controller: _passwordController,
              decoration: InputFieldDecoration(StringConstants.LABEL_PASSWORD),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            FlatButtonWithRoundedBorder(
              label: StringConstants.LABEL_LOGIN,
              onPressed: () {
                _showDialog(context, "Login Pressed");
              },
            )
          ],
        ));
  }

  _showDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              textDirection: TextDirection.ltr,
            ),
          );
        });
  }
}
