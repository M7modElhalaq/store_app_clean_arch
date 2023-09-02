import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

class EmptyProductsWidget extends StatelessWidget {
  const EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: baseText(
          name: ManagerStrings.emptyProducts,
          color: ManagerColors.black,
          fontSize: ManagerFontSizes.s24,
        ),
      ),
    );
  }
}
