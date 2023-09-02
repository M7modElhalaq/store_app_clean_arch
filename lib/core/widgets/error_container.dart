import 'package:flutter/material.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_styles.dart';
import '../resources/manager_colors.dart';

Container errorContainer(String message) {
  return Container(
    width: Constance.deviceWidth,
    height: Constance.deviceHeight,
    alignment: Alignment.center,
    padding: EdgeInsetsDirectional.only(
      bottom: ManagerHeights.h100,
    ),
    child: Text(
      message,
      style: getMediumTextStyle(
        fontSize: ManagerFontSizes.s24,
        color: ManagerColors.grey,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
