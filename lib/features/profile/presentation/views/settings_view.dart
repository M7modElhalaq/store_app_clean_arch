import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/features/profile/presentation/controller/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Constance.appBarElevation,
        backgroundColor: ManagerColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Center(
          child: Text(ManagerStrings.settingsViewTitle),
        ),
      ),
      body: GetBuilder<SettingsController>(
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w24, vertical: ManagerHeights.h24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                baseText(
                  name: ManagerStrings.accountInformation,
                  color: ManagerColors.black,
                  fontSize: ManagerFontSizes.s20,
                ),
                SizedBox(height: ManagerHeights.h24,),
                GestureDetector(
                  onTap: () => controller.changeLanguage(context, languageCode: controller.currentLanguage == 'ar' ? 'en' : 'ar'),
                  child: Container(
                    width: double.infinity,
                    height: ManagerHeights.h50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ManagerRadius.r16),
                      border: Border.all(
                        color: ManagerColors.borderColor,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w12, vertical: ManagerHeights.h8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          baseText(
                            name: ManagerStrings.settingsLanguage,
                            color: ManagerColors.black,
                            fontSize: ManagerFontSizes.s18,
                            fontWeight: ManagerFontWeight.bold,
                          ),
                          Row(
                            children: [
                              baseText(
                                name: controller.currentLanguage,
                                color: ManagerColors.primaryColor,
                                fontSize: ManagerFontSizes.s12,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: ManagerFontSizes.s18,
                                color: ManagerColors.primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
