// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'text_utils.dart';

class ElevatedButtonUtils extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final double paddingHerizontal;
  final double paddingVertical;
  final Color color;
  final Color primary;
  final TextDecoration decoration;
  final Function() onPressed;
  const ElevatedButtonUtils({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    required this.decoration,
    required this.paddingHerizontal,
    required this.paddingVertical,
    required this.primary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.symmetric(
                horizontal: paddingHerizontal, vertical: paddingVertical)),
        onPressed: onPressed,
        child: TextUtils(
          text: text,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
        ));
  }
}
