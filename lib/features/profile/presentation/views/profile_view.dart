import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/strings/routes.dart';
import 'package:store_app/core/views/complete_profile_view.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/confirm_dialog.dart';
import 'package:store_app/core/widgets/profile_avatar_image_widget.dart';
import 'package:store_app/core/widgets/vertical_divider_widget.dart';
import 'package:store_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:store_app/features/auth/presentation/bloc/login/login_state.dart';
import 'package:store_app/features/profile/presentation/widgets/share_app_bottom_sheet.dart';
import 'package:store_app/features/profile/presentation/widgets/share_icon_widget.dart';
import 'package:store_app/features/profile/presentation/widgets/support_app_bottom_sheet.dart';
import 'package:store_app/features/profile/presentation/widgets/text_button_widget.dart';

import '../../../../core/resources/manager_assets.dart';
import 'profile_personal_info_view.dart';

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
            padding: const EdgeInsetsDirectional.only(end: ManagerWidth.w20),
            child: InkWell(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.MAIN_APP_VIEW),
              child: const HeroIcon(
                HeroIcons.arrowRight,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<LoginBloc, LoginStates>(builder: (context, state) {
        var customer = BlocProvider.of<LoginBloc>(context).customer;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: ManagerMargin.h24, vertical: ManagerMargin.v30),
              child: Column(
                children: [
                  Row(
                    children: [
                      ProfileAvatarImageWidget(
                        radius: ManagerRadius.r50,
                        image: customer!.profileImage == ''
                            ? null
                            : customer.profileImage,
                      ),
                      const SizedBox(
                        width: ManagerWidth.w12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          baseText(
                            name: customer!.name,
                            fontWeight: ManagerFontWeight.bold,
                            color: ManagerColors.black,
                          ),
                          const SizedBox(
                            height: ManagerHeights.h16,
                          ),
                          baseText(
                            name: '${customer!.phoneNumber}+',
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfilePersonalInfoView(),
                              ),
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
                  const SizedBox(
                    height: ManagerHeights.h70,
                  ),
                  TextButtonWidget(
                    icon: HeroIcons.share,
                    text: ManagerStrings.profileShareApp,
                    lastIcon: HeroIcons.chevronLeft,
                    onTap: () => shareAppBottomSheet(context),
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
                    onTap: () {},
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
                          BlocProvider.of<LoginBloc>(context).logout(context);
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
      }),
    );
  }
}
