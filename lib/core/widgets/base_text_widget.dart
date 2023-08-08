import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_fonts.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_font_sizes.dart';

Text baseText(
    {String? name,
    double? fontSize,
    Color? color,
    String? fontFamily,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    }) {
  return Text(
    name ?? '',
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize ?? ManagerFontSizes.s16,
      color: color ?? ManagerColors.textColor,
      fontFamily: fontFamily ?? ManagerFont.appFont,
      fontWeight: fontWeight ?? ManagerFontWeight.w400,
    ),
  );
}
