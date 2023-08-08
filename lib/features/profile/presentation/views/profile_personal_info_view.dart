import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/views/complete_profile_view.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/profile_avatar_image_widget.dart';
import 'package:store_app/core/widgets/profile_text_widget.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';

class ProfilePersonalInfoView extends StatelessWidget {
  const ProfilePersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CompleteProfileView(
                  phoneNumber: 00972599187654,
                ),
              ),
            );
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
            padding: const EdgeInsetsDirectional.only(end: ManagerWidth.w20),
            child: InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ProfileView())),
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
                  ),
                ),
                const SizedBox(
                  height: ManagerHeights.h12,
                ),
                baseText(
                  name: ManagerStrings.userNameLabel,
                  fontSize: ManagerFontSizes.s14,
                ),
                ProfileTextWidget(
                  icon: HeroIcons.user,
                  text: ManagerStrings.userNameLabel,
                  fontSize: ManagerFontSizes.s16,
                ),
                const SizedBox(
                  height: ManagerHeights.h12,
                ),
                baseText(
                  name: ManagerStrings.phoneNumberLabel,
                  fontSize: ManagerFontSizes.s14,
                ),
                ProfileTextWidget(
                  icon: HeroIcons.devicePhoneMobile,
                  text: ManagerStrings.phoneNumberLabel,
                  fontSize: ManagerFontSizes.s16,
                ),
                const SizedBox(
                  height: ManagerHeights.h12,
                ),
                baseText(
                  name: ManagerStrings.emailLabel,
                  fontSize: ManagerFontSizes.s14,
                ),
                ProfileTextWidget(
                  icon: HeroIcons.envelope,
                  text: ManagerStrings.emailLabel,
                  fontSize: ManagerFontSizes.s16,
                ),
                const SizedBox(
                  height: ManagerHeights.h12,
                ),
                baseText(
                  name: ManagerStrings.idNumberLabel,
                  fontSize: ManagerFontSizes.s14,
                ),
                ProfileTextWidget(
                  icon: HeroIcons.identification,
                  text: ManagerStrings.idNumberLabel,
                  fontSize: ManagerFontSizes.s16,
                ),
                const SizedBox(
                  height: ManagerHeights.h12,
                ),
                baseText(
                  name: ManagerStrings.dayOfBirthLabel,
                  fontSize: ManagerFontSizes.s14,
                ),
                ProfileTextWidget(
                  icon: HeroIcons.calendarDays,
                  text: ManagerStrings.dayOfBirthLabel,
                  fontSize: ManagerFontSizes.s16,
                ),
                const SizedBox(
                  height: ManagerHeights.h12,
                ),
                baseText(
                  name: ManagerStrings.genderLabel,
                  fontSize: ManagerFontSizes.s14,
                ),
                ProfileTextWidget(
                  icon: HeroIcons.userPlus,
                  text: ManagerStrings.genderLabel,
                  fontSize: ManagerFontSizes.s16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
