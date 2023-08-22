import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  final HeroIcons icon;
  String? text;
  HeroIcons? lastIcon;
  void Function()? onTap;
  TextButtonWidget({super.key, required this.icon, this.text, this.lastIcon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                name: text ?? '',
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontSizes.s18
            ),
            const Spacer(),
            if(lastIcon != null) ... [
              HeroIcon(
                lastIcon!,
                style: HeroIconStyle.solid,
                color: ManagerColors.primaryColor,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
