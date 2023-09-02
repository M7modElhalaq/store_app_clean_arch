import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';

void profileImageBottomSheet(BuildContext context, void Function()? gallery, void Function()? camera) {
  showModalBottomSheet(
    elevation: 10,
    backgroundColor: Colors.amber,
    context: context,
    builder: (ctx) => Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ManagerColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ManagerRadius.r12),
          topRight: Radius.circular(ManagerRadius.r12),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: ManagerWidth.w40, horizontal: ManagerHeights.h50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: gallery,
              child: Image.asset(
                ManagerAssets.galleryIconImage,
                width: ManagerWidth.w70,
                height: ManagerHeights.h70,
                color: ManagerColors.primaryColor,
              ),
            ),
            GestureDetector(
              onTap: camera,
              child: Image.asset(
                ManagerAssets.cameraIconImage,
                width: ManagerWidth.w70,
                height: ManagerHeights.h70,
                color: ManagerColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
