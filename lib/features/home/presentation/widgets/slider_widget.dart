import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_padding.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

import 'progress_indicator.dart';

class SliderWidget extends StatelessWidget {
  final int index;
  final String? sliderImage;
  final String? title;
  final String? subTitle;

  const SliderWidget({
    Key? key,
    this.index = 0,
    this.sliderImage,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ManagerHeights.h150,
      padding: const EdgeInsets.all(ManagerPadding.p12),
      decoration: BoxDecoration(
        color: ManagerColors.sliderBackgroundColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              sliderImage ?? ManagerAssets.sliderImage1,
              height: ManagerHeights.h100,
              width: ManagerWidth.w200,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              baseText(
                name: title ?? ManagerStrings.sliderTitle,
                color: ManagerColors.white,
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontSizes.s20,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: ManagerHeights.h12),
              baseText(
                name: subTitle ?? ManagerStrings.sliderSubTitle,
                color: ManagerColors.white,
                fontSize: ManagerFontSizes.s16,
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              Row(
                children: [
                  progressIndicator(color: index == 0 ? ManagerColors.white : ManagerColors.white70),
                  progressIndicator(color: index == 1 ? ManagerColors.white : ManagerColors.white70),
                  progressIndicator(color: index == 2 ? ManagerColors.white : ManagerColors.white70),
                  progressIndicator(color: index == 3 ? ManagerColors.white : ManagerColors.white70),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
