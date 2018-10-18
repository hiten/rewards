import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rewards/firebase/AuthManager.dart';
import 'package:rewards/shared/FlatButtonWithRoundedBorder.dart';
import 'package:rewards/shared/InputFieldDecoration.dart';
import 'package:rewards/values/dimens.dart';
import 'package:rewards/values/strings.dart';

class SignupScreen extends StatefulWidget {
  final AuthManager _authManager = AuthManager();

  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState(_authManager);
  }
}

class SignUpScreenState extends State<SignupScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey _signUpFormKey = GlobalKey<FormState>();

  final AuthManager _authManager;

  SignUpScreenState(this._authManager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        minimum: EdgeInsets.all(Dimens.MARGIN_16),
        child: Form(
          key: _signUpFormKey,
          child: _formLayout(context),
        ),
      ),
    );
  }

  Widget _formLayout(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      direction: Axis.vertical,
      children: <Widget>[
        SizedBox(height: 80.0),
        // Logo view
        Text(
          "Reward's",
          textScaleFactor: 2.0,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30.0),

        // Username
        TextFormField(
            validator: (emailInput) {
              if (emailInput.trim().length == 0) {
                return "Please enter a valid userName";
              }
            },
            controller: _userNameController,
            decoration: InputFieldDecoration(StringConstants.LABEL_USERNAME),
            obscureText: false),

        // Email
        SizedBox(height: 30.0),
        TextFormField(
            validator: (emailInput) {
              if (emailInput.trim().length == 0) {
                return "Please enter a valid email";
              }
            },
            controller: _emailController,
            decoration: InputFieldDecoration(StringConstants.LABEL_EMAIL),
            obscureText: false),

        // Password
        SizedBox(height: 30.0),
        TextFormField(
            validator: (password) {
              if (password.trim().length == 0) {
                return "Please enter a valid email";
              }
            },
            controller: _passwordController,
            decoration: InputFieldDecoration(StringConstants.LABEL_PASSWORD),
            obscureText: false),

        // Confirm Password
        SizedBox(height: 30.0),
        TextFormField(
            validator: (confirmPassword) {
              if (confirmPassword.trim().length == 0) {
                return "Please enter a valid password";
              }
            },
            controller: _confirmPasswordController,
            decoration:
                InputFieldDecoration(StringConstants.LABEL_CONFIRM_PASSWORD),
            obscureText: false),

        // Sign up button
        SizedBox(height: 30.0),
        FlatButtonWithRoundedBorder(
          label: StringConstants.LABEL_SIGN_UP,
          onPressed: () {
            FutureBuilder<FirebaseUser>(
                future: this._authManager.createUser(
                    _emailController.text, _passwordController.text),
                builder: (BuildContext context,
                    AsyncSnapshot<FirebaseUser> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      {
                        return _showDialog(context, "Creating user");
                      }
                    case ConnectionState.done:
                      {
                        return _showDialog(
                            context, snapshot.data.email + " Created");
                      }
                    case ConnectionState.active:
                      {
                        return null;
                      }
                    case ConnectionState.none:
                      {
                        return null;
                      }
                  }
                });
          },
        )
      ],
    );
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
