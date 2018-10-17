import 'package:flutter/material.dart';
import 'package:rewards/shared/FlatButtonWithRoundedBorder.dart';
import 'package:rewards/shared/InputFieldDecoration.dart';
import 'package:rewards/values/dimens.dart';
import 'package:rewards/values/strings.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupScreenState();
  }
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey _signupFormKey = GlobalKey();

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
            debugPrint("Button Clicked");
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        minimum: EdgeInsets.all(Dimens.MARGIN_16),
        child: Form(
          key: _signupFormKey,
          child: _formLayout(context),
        ),
      ),
    );
  }
}
