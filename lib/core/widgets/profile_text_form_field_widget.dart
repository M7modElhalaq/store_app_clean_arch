import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';

import '../resources/manager_colors.dart';

TextFormField textFormField({
  required TextEditingController controller,
  String? hintText,
  double? hintFontSize,
  Widget? prefixIcon,
  void Function()? onTap,
  bool readOnly = false,
  String? Function(String?)? validator
}) {
  return TextFormField(
    style: TextStyle(
      color: ManagerColors.black,
    ),
    controller: controller,
    validator: validator,
    onTap: onTap,
    readOnly: readOnly,
    decoration: InputDecoration(
      prefixIcon: prefixIcon ?? HeroIcon(
        HeroIcons.user,
        style: HeroIconStyle.solid,
        color: ManagerColors.primaryColor,
      ),
      hintText: hintText ?? '',
      hintStyle: TextStyle(
        color: ManagerColors.grey,
        fontSize: hintFontSize ?? ManagerFontSizes.s14,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.primaryColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.grey),
      ),
    ),
  );
}
