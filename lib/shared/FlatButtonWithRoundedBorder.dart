import 'package:flutter/material.dart';
import 'package:rewards/values/dimens.dart';

class FlatButtonWithRoundedBorder extends FlatButton {
  final String label;
  final Color backGroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Color borderColor;

  FlatButtonWithRoundedBorder(
      {@required this.label,
      @required this.onPressed,
      this.textColor: Colors.black87,
      this.backGroundColor: Colors.transparent,
      this.borderColor: Colors.black87})
      : super(
          child: Text(
            label,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: textColor),
          ),
          padding: EdgeInsets.all(Dimens.MARGIN_16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              side: BorderSide(
                color: borderColor,
                width: 2.0,
                style: BorderStyle.solid,
              )),
          onPressed: onPressed,
        );
}
