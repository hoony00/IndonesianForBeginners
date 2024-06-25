import 'package:flutter/material.dart';


class CustomTextStyle extends TextStyle {
  const CustomTextStyle({
    required String fontFamily,
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    int? height,
    Paint? foreground,
}) : super(
    fontFamily: fontFamily,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: height == null ? null : height / fontSize,
    foreground: foreground,
  );
}
