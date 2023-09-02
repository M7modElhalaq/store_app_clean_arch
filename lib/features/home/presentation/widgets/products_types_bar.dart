import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

class ProductsTypeBar extends StatelessWidget {
  final bool isActive;
  void Function()? onTap;
  final String title;
  ProductsTypeBar({super.key, required this.isActive, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 90,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: isActive
              ? ManagerColors.primaryColor
              : ManagerColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: baseText(
          name: title ?? '',
          color: isActive
              ? ManagerColors.white
              : ManagerColors.textColor,
        ),
      ),
    );
  }
}
