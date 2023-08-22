import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

import '../resources/manager_strings.dart';

class ProfileTextWidget extends StatelessWidget {
  final HeroIcons icon;
  String? text;
  double? fontSize;
  ProfileTextWidget({super.key, required this.icon, this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: ManagerHeights.h12),
      margin: const EdgeInsets.symmetric(vertical: ManagerHeights.h12),
      decoration: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ManagerColors.textButtonUnderLineColor,
        ),
      ),
      child: Row(
        children: [
          HeroIcon(
            icon,
            style: HeroIconStyle.solid,
            color: ManagerColors.primaryColor,
          ),
          const SizedBox(width: ManagerWidth.w16,),
          baseText(
              name: text == '' ? ManagerStrings.nullValue : text,
              fontWeight: ManagerFontWeight.bold,
              fontSize: fontSize ?? ManagerFontSizes.s18,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
