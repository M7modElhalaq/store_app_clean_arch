import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_font_sizes.dart';
import '../../../../../core/resources/manager_font_weight.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/strings/manager_strings.dart';
import '../../../../../core/widgets/base_text_widget.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      baseText(
        name: ManagerStrings.sliderTitle,
        color: ManagerColors.white,
        fontWeight: ManagerFontWeight.bold,
        fontSize: ManagerFontSizes.s20,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: ManagerHeights.h12),
      baseText(
        name: ManagerStrings.sliderSubTitle,
        color: ManagerColors.white,
        fontSize: ManagerFontSizes.s16,
        textAlign: TextAlign.start,
      ),
    ],);
  }
}
