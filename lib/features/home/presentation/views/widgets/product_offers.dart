import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

class ProductOffers extends StatelessWidget {
  final Color? bgColor;
  final String? image;
  final String? text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWidth;

  const ProductOffers({Key? key, this.bgColor, this.image, this.text, this.fontSize, this.textColor, this.fontWidth,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidth.w40,
      height: ManagerHeights.h20,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: ManagerMargin.v4,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? ManagerColors.newProductColor,
        borderRadius: BorderRadius.circular(
            ManagerRadius.r12),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          if(image != null)...[
            Image.asset(
              image!,
              width: ManagerWidth.w10,
              height: ManagerHeights.h8,
            ),
          ],
          baseText(
            name: text ?? '',
            fontSize: fontSize ?? ManagerFontSizes.s8,
            color: textColor ?? ManagerColors.white,
            fontWeight: fontWidth ?? ManagerFontWeight.bold,
          ),
        ],
      ),
    );
  }
}
