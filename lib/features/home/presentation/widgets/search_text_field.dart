import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_strings.dart';

class SearchTextField extends StatelessWidget {
  TextEditingController? controller;
  SearchTextField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: ManagerColors.black,
      ),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: HeroIcon(
          HeroIcons.magnifyingGlass,
          color: ManagerColors.iconsColor,
        ),
        hintText: ManagerStrings.searchHint,
        hintStyle: TextStyle(
          color: ManagerColors.grey,
          fontSize: ManagerFontSizes.s14,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ManagerColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ManagerColors.borderColor),
          borderRadius: BorderRadius.circular(ManagerRadius.r30),
        ),
      ),
    );
  }
}
