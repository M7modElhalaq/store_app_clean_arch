import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';

class ProductColorWidget extends StatelessWidget {
  int? color;
  bool? isSelected = false;
  void Function()? onTap;
  ProductColorWidget({super.key, this.color, this.onTap, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ManagerWidth.w36,
        height: ManagerHeights.h36,
        margin:
        const EdgeInsets.only(left: ManagerMargin.v8),
        padding: const EdgeInsets.all(ManagerMargin.v4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected!
                ? ManagerColors.black
                : ManagerColors.white,
          ),
          borderRadius:
          BorderRadius.circular(ManagerRadius.r20),
        ),
        child: Container(
          width: ManagerWidth.w24,
          height: ManagerHeights.h24,
          decoration: BoxDecoration(
            color: Color(color ?? 0xff000000),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
