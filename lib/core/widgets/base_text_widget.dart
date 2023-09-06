import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_fonts.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_font_sizes.dart';

Widget baseText(
    {String? name,
    double? fontSize,
    Color? color,
    String? fontFamily,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextDecoration? decoration,
    bool visible = true,
    int? maxLines = 1,
    }) {
  return Visibility(
    visible: visible,
    child: Text(
      name ?? '',
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      style: TextStyle(
        fontSize: fontSize ?? ManagerFontSizes.s16,
        color: color ?? ManagerColors.black,
        fontFamily: fontFamily ?? ManagerFont.appFont,
        fontWeight: fontWeight ?? ManagerFontWeight.w400,
        decoration: decoration ?? TextDecoration.none,
        overflow: TextOverflow.fade,
      ),
    ),
  );
}
