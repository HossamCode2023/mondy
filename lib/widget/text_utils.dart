import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextDecoration decoration;
  const TextUtils({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
            fontSize: fontSize));
  }
}
