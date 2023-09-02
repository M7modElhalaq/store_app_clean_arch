import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/profile_avatar_image_widget.dart';
import 'package:store_app/core/widgets/profile_text_widget.dart';
import 'package:store_app/features/profile/presentation/controller/profile_controller.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';
import 'package:store_app/routes/routes.dart';

class ProfilePersonalInfoView extends StatelessWidget {
  const ProfilePersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: Constance.appBarElevation,
            backgroundColor: ManagerColors.white,
            leading: IconButton(
              icon: HeroIcon(
                HeroIcons.pencilSquare,
                color: ManagerColors.primaryColor,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, Routes.completeProfileView,
                    arguments: {
                      'phoneNumber': controller.phoneNumber,
                    });
              },
            ),
            title: Center(
              child: baseText(
                name: ManagerStrings.profilePersonalInfoPageTitle,
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontSizes.s24,
              ),
            ),
            actions: [
              Padding(
                padding:
                    EdgeInsetsDirectional.only(end: ManagerWidth.w20),
                child: InkWell(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileView())),
                  child: const HeroIcon(
                    HeroIcons.arrowRight,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: ManagerMargin.h24, vertical: ManagerMargin.v30),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ProfileAvatarImageWidget(
                        radius: ManagerRadius.r50,
                        image: controller.customer!.profileImage,
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    baseText(
                      name: ManagerStrings.userNameLabel,
                      fontSize: ManagerFontSizes.s14,
                    ),
                    ProfileTextWidget(
                      icon: HeroIcons.user,
                      text: controller.customer!.name,
                      fontSize: ManagerFontSizes.s16,
                    ),
                    SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    baseText(
                      name: ManagerStrings.phoneNumberLabel,
                      fontSize: ManagerFontSizes.s14,
                    ),
                    ProfileTextWidget(
                      icon: HeroIcons.devicePhoneMobile,
                      text: controller.customer!.phoneNumber.toString(),
                      fontSize: ManagerFontSizes.s16,
                    ),
                    SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    baseText(
                      name: ManagerStrings.emailLabel,
                      fontSize: ManagerFontSizes.s14,
                    ),
                    ProfileTextWidget(
                      icon: HeroIcons.envelope,
                      text: controller.customer!.email,
                      fontSize: ManagerFontSizes.s16,
                    ),
                    SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    baseText(
                      name: ManagerStrings.idNumberLabel,
                      fontSize: ManagerFontSizes.s14,
                    ),
                    ProfileTextWidget(
                      icon: HeroIcons.identification,
                      text: controller.customer!.idNumber == 0
                          ? ''
                          : controller.customer!.idNumber.toString(),
                      fontSize: ManagerFontSizes.s16,
                    ),
                    SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    baseText(
                      name: ManagerStrings.dayOfBirthLabel,
                      fontSize: ManagerFontSizes.s14,
                    ),
                    ProfileTextWidget(
                      icon: HeroIcons.calendarDays,
                      text: controller.customer!.dateOfBirth,
                      fontSize: ManagerFontSizes.s16,
                    ),
                    SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    baseText(
                      name: ManagerStrings.genderLabel,
                      fontSize: ManagerFontSizes.s14,
                    ),
                    ProfileTextWidget(
                      icon: HeroIcons.userPlus,
                      text:
                      controller.customer!.gender == 'Male' || controller.customer!.gender == 'male'
                              ? 'ذكر'
                              : 'إنثي',
                      fontSize: ManagerFontSizes.s16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
