import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_padding.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_offers.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeights.h220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r12),
        border: Border.all(
          color: ManagerColors.borderColor,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: ManagerHeights.h120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(ManagerRadius.r12),
                topEnd: Radius.circular(ManagerRadius.r12),
              ),
              color: ManagerColors.productImageBackgroundColor,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ManagerAssets.productImage,
                    width: ManagerWidth.w100,
                    height: ManagerHeights.h85,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(ManagerMargin.h8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: ManagerWidth.w30,
                            height: ManagerHeights.h30,
                            decoration: BoxDecoration(
                              color: ManagerColors.white,
                              borderRadius: BorderRadius.circular(
                                  ManagerRadius.r20),
                            ),
                            child: IconButton(
                              icon: const HeroIcon(
                                HeroIcons.heart,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          ProductOffers(
                            bgColor: ManagerColors.yellow,
                            text: ManagerStrings.trend,
                            fontSize: ManagerFontSizes.s10,
                            textColor: ManagerColors.black,
                            fontWidth: ManagerFontWeight.bold,
                            image: ManagerAssets.productFlame,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ProductOffers(
                            bgColor: ManagerColors.discountColor
                                .withOpacity(.7),
                            text: '%20',
                            fontSize: ManagerFontSizes.s12,
                            textColor: ManagerColors.white,
                          ),
                          const SizedBox(
                            height: ManagerHeights.h8,
                          ),
                          ProductOffers(
                            bgColor: ManagerColors.newProductColor,
                            text: ManagerStrings.newProduct,
                            fontSize: ManagerFontSizes.s10,
                            textColor: ManagerColors.white,
                            fontWidth: ManagerFontWeight.bold,
                            image: ManagerAssets.productStar,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ManagerHeights.h100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: ManagerMargin.v8,
                      top: ManagerMargin.h8,
                      bottom: ManagerMargin.h8,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      baseText(
                        name: ManagerStrings.productTitle,
                        fontSize: ManagerFontSizes.s14,
                      ),
                      baseText(
                        name: ManagerStrings.productCategory,
                        fontSize: ManagerFontSizes.s14,
                        color: ManagerColors.black,
                      ),
                      Row(
                        children: [
                          const Text(
                            '\$20',
                            style: TextStyle(
                                decoration:
                                TextDecoration.lineThrough,),
                          ),
                          const SizedBox(width: 4,),
                          baseText(
                            name: "\$18",
                            fontSize: ManagerFontSizes.s18,
                            color: ManagerColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: ManagerWidth.w36,
                    height: ManagerHeights.h36,
                    decoration: BoxDecoration(
                      color: ManagerColors.borderColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(ManagerRadius.r12),
                        bottomLeft: Radius.circular(ManagerRadius.r12),
                      ),
                    ),
                    child: IconButton(
                      icon: HeroIcon(HeroIcons.shoppingCart, color: ManagerColors.primaryColor,),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
