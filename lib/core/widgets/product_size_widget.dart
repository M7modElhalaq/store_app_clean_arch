import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

class ProductSizeWidget extends StatelessWidget {
  final String size;
  void Function()? onTap;
  bool? isSelected = false;
  ProductSizeWidget({super.key, required this.size, this.onTap, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ManagerWidth.w50,
        height: ManagerHeights.h36,
        margin:
        const EdgeInsets.only(left: ManagerMargin.v8),
        padding: const EdgeInsets.all(ManagerMargin.v4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected!
                ? ManagerColors.black
                : ManagerColors.grey.withOpacity(.3),
          ),
          borderRadius:
          BorderRadius.circular(ManagerRadius.r20),
        ),
        alignment: Alignment.center,
        child: baseText(
          name: size,
          color: ManagerColors.black,
          fontWeight: ManagerFontWeight.bold,
        ),
      ),
    );
  }
}
