import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_fonts.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
  TextDecoration decoration,
  dynamic overflow,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
    overflow: overflow,
  );
}

// Regular TextStyle
TextStyle getRegularTextStyle({
  required double fontSize,
  required Color color,
  dynamic overflow = TextOverflow.visible,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    ManagerFont.appFont,
    ManagerFontWeight.regular,
    color,
    decoration,
    overflow,
  );
}

// Medium TextStyle
TextStyle getMediumTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  dynamic overflow = TextOverflow.visible,
}) {
  return _getTextStyle(
    fontSize,
    ManagerFont.appFont,
    ManagerFontWeight.medium,
    color,
    decoration,
    overflow,
  );
}

// Bold TextStyle
TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  dynamic overflow = TextOverflow.visible,
}) {
  return _getTextStyle(fontSize, ManagerFont.appFont,
      ManagerFontWeight.bold, color, decoration, overflow);
}
