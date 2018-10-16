import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: _formKey,
        child: new ListView(
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Icon(Icons.verified_user),
            SizedBox(
              height: 80.0,
            ),
            _getEditBox(false, "UserEmail", _emailController, (emailInput) {
              if (emailInput.trim().length == 0) {
                return "Please enter a valid email";
              }
            }),
            SizedBox(
              height: 30.0,
            ),
            _getEditBox(true, "Password", _passwordController, (emailInput) {
              if (emailInput.trim().length == 0) {
                return "Please enter a valid email";
              }
            }),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              child: Text("Login"),
              color: Colors.yellow,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _showDialog(context, "Thank you");
                }
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

  Widget _getEditBox(bool obscureText, String hint,
      TextEditingController controller, FormFieldValidator validator) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          labelText: hint,
          labelStyle: TextStyle(color: Colors.black)),
      obscureText: obscureText,
    );
  }
}
