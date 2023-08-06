
import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_radius.dart';
import '../../../../../core/resources/manager_width.dart';

Container progressIndicator({Color? color}) {
  return Container(
    width: ManagerWidth.w8,
    height: ManagerHeights.h8,
    margin: const EdgeInsetsDirectional.only(end: ManagerWidth.w8,),
    decoration: BoxDecoration(
      color: color ?? ManagerColors.white70,
      borderRadius: BorderRadius.circular(
        ManagerRadius.r8,
      ),
    ),
  );
}
