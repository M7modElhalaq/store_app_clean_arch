import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/vertical_divider_widget.dart';

import '../resources/manager_font_weight.dart';

void confirmDialog(
  BuildContext context, {
  String? image,
  String? text,
  required void Function()? onPressedConfirm,
}) {
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: ManagerColors.white,
          contentPadding: const EdgeInsets.all(0),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: ManagerHeights.h280,
              decoration: BoxDecoration(
                color: ManagerColors.white,
                borderRadius: BorderRadius.circular(ManagerRadius.r8),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: ManagerMargin.h24,
                      vertical: ManagerMargin.v12,
                    ),
                    height: ManagerHeights.h200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            image ?? ManagerAssets.confirmLogoutDialogImage),
                        baseText(
                          name:
                              text ?? ManagerStrings.confirmLogoutDialogMessage,
                          color: ManagerColors.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: ManagerColors.black,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: onPressedConfirm,
                            child: baseText(
                              name: ManagerStrings.confirmLogout,
                              color: ManagerColors.black,
                              fontWeight: ManagerFontWeight.bold,
                            ),
                          ),
                        ),
                        verticalDivider(
                          thickness: 1,
                          color: ManagerColors.black,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: baseText(
                              name: ManagerStrings.cancel,
                              color: ManagerColors.primaryColor,
                              fontWeight: ManagerFontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
