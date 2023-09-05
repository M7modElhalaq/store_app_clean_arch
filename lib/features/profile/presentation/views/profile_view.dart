import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:share_plus/share_plus.dart';
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
import 'package:store_app/core/widgets/confirm_dialog.dart';
import 'package:store_app/core/widgets/profile_avatar_image_widget.dart';
import 'package:store_app/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:store_app/features/profile/presentation/controller/profile_controller.dart';
import 'package:store_app/features/profile/presentation/widgets/support_app_bottom_sheet.dart';
import 'package:store_app/features/profile/presentation/widgets/text_button_widget.dart';
import 'package:store_app/routes/routes.dart';

import '../../../../core/resources/manager_assets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Constance.appBarElevation,
        backgroundColor: ManagerColors.white,
        automaticallyImplyLeading: false,
        title: Center(
          child: baseText(
            name: ManagerStrings.profilePageTitle,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontSizes.s24,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: ManagerWidth.w20),
            child: InkWell(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.mainAppView),
              child: const HeroIcon(
                HeroIcons.arrowRight,
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
            if(controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ManagerColors.primaryColor,
                ),
              );
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: ManagerMargin.h24,
                      vertical: ManagerMargin.v30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ProfileAvatarImageWidget(
                            radius: ManagerRadius.r50,
                            image: controller.customer!.profileImage,
                          ),
                          SizedBox(
                            width: ManagerWidth.w12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              baseText(
                                name: controller.customer!.name,
                                fontWeight: ManagerFontWeight.bold,
                                color: ManagerColors.black,
                              ),
                              SizedBox(
                                height: ManagerHeights.h16,
                              ),
                              baseText(
                                name: '${controller.customer!.phoneNumber}+',
                                color: ManagerColors.secondaryTextColor,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: ManagerWidth.w36,
                            height: ManagerHeights.h36,
                            decoration: BoxDecoration(
                              color: ManagerColors.primaryColor,
                              borderRadius:
                              BorderRadius.circular(ManagerRadius.r30),
                            ),
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.profilePersonalInfoView,
                                  arguments: {
                                    Constance.customerData: controller.customer,
                                  },
                                );
                              },
                              icon: HeroIcon(
                                HeroIcons.pencilSquare,
                                color: ManagerColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ManagerHeights.h70,
                      ),
                      TextButtonWidget(
                        icon: HeroIcons.share,
                        text: ManagerStrings.profileShareApp,
                        lastIcon: HeroIcons.chevronLeft,
                        onTap: () async {
                          await Share.share('check out my github ${Constance.github}');
                        },
                      ),
                      TextButtonWidget(
                        icon: HeroIcons.chatBubbleLeft,
                        text: ManagerStrings.profileSupport,
                        lastIcon: HeroIcons.chevronLeft,
                        onTap: () => supportAppBottomSheet(context),
                      ),
                      TextButtonWidget(
                        icon: HeroIcons.cog8Tooth,
                        text: ManagerStrings.profileSettings,
                        lastIcon: HeroIcons.chevronLeft,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.settingsView);
                        },
                      ),
                      TextButtonWidget(
                        icon: HeroIcons.arrowLeftOnRectangle,
                        text: ManagerStrings.profileLogout,
                        onTap: () {
                          confirmDialog(
                            context,
                            image: ManagerAssets.confirmLogoutDialogImage,
                            text: ManagerStrings.confirmLogoutDialogMessage,
                            onPressedConfirm: () {
                              BlocProvider.of<ProfileBloc>(context)
                                  .logout(context);
                            },
                          );
                        },
                      ),
                      TextButtonWidget(
                        icon: HeroIcons.trash,
                        text: ManagerStrings.profileDeleteAccount,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}
