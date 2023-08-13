import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/features/profile/presentation/widgets/share_icon_widget.dart';
import 'package:store_app/features/profile/presentation/widgets/support_icon_widget.dart';

void supportAppBottomSheet(BuildContext context) {
  showModalBottomSheet(
    elevation: 10,
    backgroundColor: Colors.amber,
    context: context,
    builder: (ctx) =>
        Container(
          width: double.infinity,
          height: double.infinity / 2,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ManagerColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(ManagerRadius.r12),
              topRight: Radius.circular(ManagerRadius.r12),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: HeroIcon(
                      HeroIcons.xMark,
                      color: ManagerColors.red,
                      style: HeroIconStyle.solid,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    width: ManagerWidth.w50,
                    height: ManagerHeights.h8,
                    decoration: BoxDecoration(
                      color: ManagerColors.borderColor,
                      borderRadius: BorderRadius.circular(ManagerRadius.r12),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
              const SizedBox(
                height: ManagerHeights.h16,
              ),
              Container(
                margin: const EdgeInsets.only(right: ManagerMargin.v24),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: baseText(
                    name: ManagerStrings.profileSupport,
                    fontSize: ManagerFontSizes.s18,
                    fontWeight: ManagerFontWeight.bold,
                    color: ManagerColors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: ManagerHeights.h12,
              ),
              Divider(
                thickness: .5,
                color: ManagerColors.grey,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: ManagerMargin.v24,
                  horizontal: ManagerMargin.h24,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    baseText(
                      name: ManagerStrings.supportSheetTopText,
                      color: ManagerColors.black,
                      fontSize: ManagerFontSizes.s18,
                      fontWeight: ManagerFontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: ManagerMargin.v30,),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          SupportIconWidget(image: ManagerAssets.telephone, onTap: () {},),
                          SupportIconWidget(image: ManagerAssets.whatsapp, onTap: () {},),
                          SupportIconWidget(image: ManagerAssets.instagram, onTap: () {},),
                          SupportIconWidget(image: ManagerAssets.facebook, onTap: () {},),
                          SupportIconWidget(image: ManagerAssets.twitter, onTap: () {},),
                  ],
                ),
              ),
                    ),
              baseText(
                name: ManagerStrings.supportSheetBottomText,
                fontSize: ManagerFontSizes.s16,
                fontWeight: ManagerFontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
    ],
  ),)
  ,
  );
}
