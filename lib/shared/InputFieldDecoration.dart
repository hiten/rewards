import 'package:flutter/material.dart';

class InputFieldDecoration extends InputDecoration {
  final String hint;

  InputFieldDecoration(this.hint)
      : super(
            errorStyle: TextStyle(color: Colors.red),
            border: InputBorder.none,
            filled: true,
            labelText: hint,
            labelStyle: TextStyle(color: Colors.black));
}
