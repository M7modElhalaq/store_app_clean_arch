import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/widgets/helpers.dart';

import '../../../../core/layouts/style.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_icon_sizes.dart';
import '../../../../core/resources/manager_margin.dart';
import '../../../../core/resources/manager_radius.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/widgets/base_text_widget.dart';
import '../../../../core/widgets/profile_avatar_image_widget.dart';
import '../../../../core/widgets/profile_text_form_field_widget.dart';
import '../../../../core/widgets/radio_button_widget.dart';
import '../../../../core/widgets/text_button_widget.dart';
import '../../../../core/widgets/vertical_divider_widget.dart';
import '../controller/auth_controller.dart';

class RegisterView extends StatelessWidget with Helpers {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: baseText(
              name: ManagerStrings.completeProfileAppBarTitle,
              fontWeight: ManagerFontWeight.w600,
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: ManagerMargin.h24,
              vertical: ManagerHeights.h12,
            ),
            child: Form(
              key: controller.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ProfileAvatarImageWidget(
                        image: ManagerAssets.defaultProfileImage,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: ManagerWidth.w36,
                          height: ManagerHeights.h36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(ManagerRadius.r20),
                            ),
                            color: ManagerColors.primaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              // profileImageBottomSheet(
                              //   context,
                              //       () => controller.pickImage(),
                              //       () => controller.openCamera(),
                              // );
                            },
                            icon: HeroIcon(
                              HeroIcons.camera,
                              style: HeroIconStyle.solid,
                              color: ManagerColors.white,
                              size: ManagerIconSizes.s20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      baseText(
                        name: ManagerStrings.userNameLabel,
                        fontSize: ManagerFontSizes.s14,
                        fontFamily: ManagerFont.appFont,
                      ),
                      textFormField(
                        controller: controller.userNameController,
                        hintText: ManagerStrings.hintTextUserName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ManagerStrings.usernameValidationMessage;
                          }
                          return null;
                        },
                        prefixIcon: HeroIcon(
                          HeroIcons.user,
                          style: HeroIconStyle.solid,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      baseText(
                        name: ManagerStrings.emailLabel,
                        fontSize: ManagerFontSizes.s14,
                        fontFamily: ManagerFont.appFont,
                      ),
                      textFormField(
                        controller: controller.emailController,
                        hintText: ManagerStrings.hintTextEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ManagerStrings.emailValidationMessage;
                          }
                          return null;
                        },
                        prefixIcon: HeroIcon(
                          HeroIcons.envelope,
                          style: HeroIconStyle.solid,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      baseText(
                        name: ManagerStrings.idNumberLabel,
                        fontSize: ManagerFontSizes.s14,
                        fontFamily: ManagerFont.appFont,
                      ),
                      textFormField(
                        controller: controller.idController,
                        hintText: ManagerStrings.hintTextIdNumber,
                        prefixIcon: HeroIcon(
                          HeroIcons.identification,
                          style: HeroIconStyle.solid,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      baseText(
                        name: ManagerStrings.dayOfBirthLabel,
                        fontSize: ManagerFontSizes.s14,
                        fontFamily: ManagerFont.appFont,
                      ),
                      textFormField(
                        controller: controller.dayOfBirthController,
                        hintText: ManagerStrings.hintTextDayOfBirth,
                        prefixIcon: HeroIcon(
                          HeroIcons.calendarDays,
                          style: HeroIconStyle.solid,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      baseText(
                        name: ManagerStrings.genderLabel,
                        fontSize: ManagerFontSizes.s14,
                        fontFamily: ManagerFont.appFont,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          shape: Border.all(
                            width: 0.15,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFFD0D0D0),
                          ),
                        ),
                        child: Row(
                          children: [
                            radioButton(
                                text: ManagerStrings.male,
                                value: 'Male',
                                groupValue: controller.selectedGender,
                                icon: Icon(
                                  Icons.male,
                                  color: ManagerColors.grey,
                                ),
                                onChanged: (value) {
                                  controller.changeGender(value: value!);
                                }),
                            verticalDivider(),
                            radioButton(
                              text: ManagerStrings.female,
                              value: 'Female',
                              groupValue: controller.selectedGender,
                              icon: Icon(
                                Icons.female,
                                color: ManagerColors.grey,
                              ),
                              onChanged: (value) {
                                controller.changeGender(value: value!);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      textButtonWidget(
                          buttonWidth: double.infinity,
                          text: ManagerStrings.save,
                          onPressed: () async {
                            if (controller.registerFormKey.currentState!.validate()) {
                              controller.registerCustomer(
                                context,
                                phoneNumber: controller.numberPh,
                                profileImage: controller.image.toString(),
                                userName: controller.userNameController.text,
                                email: controller.emailController.text,
                                idNumber: controller.idController.text != ''
                                    ? int.parse(controller.idController.text)
                                    : 0,
                                dayOfBirth:
                                    controller.dayOfBirthController.text,
                                gender: controller.selectedGender,
                              );
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
