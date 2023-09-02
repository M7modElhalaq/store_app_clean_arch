import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';

class ShimmerContainer extends StatelessWidget {
  double? height;
  double? width;
  ShimmerContainer({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? ManagerHeights.h80,
      margin: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidth.w20,
        vertical: ManagerHeights.h12,
      ),
      child: Shimmer.fromColors(
        baseColor: ManagerColors.greyLight,
        highlightColor: ManagerColors.white,
        child: Container(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w12,
            end: ManagerWidth.w12,
            top: ManagerHeights.h10,
            bottom: ManagerHeights.h12,
          ),
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ManagerRadius.r10,
            ),
          ),
          child: Container(
            height: ManagerHeights.h160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ManagerColors.greyLight,
              borderRadius: BorderRadius.circular(
                ManagerRadius.r12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
