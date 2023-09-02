import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';

class ShareIconWidget extends StatelessWidget {
  final String image;
  void Function()? onTap;
  ShareIconWidget({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(ManagerRadius.r12),
          border: Border.all(
            color: ManagerColors.borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            image,
            width: ManagerWidth.w40,
            height: ManagerHeights.h40,
          ),
        ),
      ),
    );
  }
}
