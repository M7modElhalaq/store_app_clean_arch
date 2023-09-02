import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/base_model/home_model.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/product_offers.dart';

import '../../routes/routes.dart';

class ProductWidget extends StatelessWidget {
  final Products product;
  void Function() addToFav;
  void Function()? addToCart;

  ProductWidget({
    Key? key,
    required this.product,
    required this.addToFav,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productView, arguments: {
          'product': product,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ManagerRadius.r12),
          border: Border.all(
            color: ManagerColors.borderColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: ManagerHeights.h120,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(ManagerRadius.r12),
                  topEnd: Radius.circular(ManagerRadius.r12),
                ),
                color: ManagerColors.productImageBackgroundColor,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      product.productThumbnail.toString(),
                      width: ManagerWidth.w100,
                      height: ManagerHeights.h86,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(ManagerMargin.h8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ManagerWidth.w30,
                              height: ManagerHeights.h30,
                              decoration: BoxDecoration(
                                color: ManagerColors.white,
                                borderRadius:
                                    BorderRadius.circular(ManagerRadius.r30),
                              ),
                              child: IconButton(
                                icon: HeroIcon(
                                  HeroIcons.heart,
                                  style: product.inFavorites ? HeroIconStyle.solid : HeroIconStyle.outline,
                                  color: product!.inFavorites ? ManagerColors.red : ManagerColors.primaryColor,
                                ),
                                onPressed: addToFav,
                              ),
                            ),
                            ProductOffers(
                              isVisible: product.trend == 1 ? true : false,
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
                              isVisible: product.discountPrice != 0 ? true : false,
                              bgColor:
                                  ManagerColors.discountColor.withOpacity(.7),
                              text: '%${product.discountPrice}',
                              fontSize: ManagerFontSizes.s12,
                              textColor: ManagerColors.white,
                            ),
                            SizedBox(
                              height: ManagerHeights.h8,
                            ),
                            ProductOffers(
                              isVisible: product.newProduct == 1 ? true : false,
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
              height: ManagerHeights.h130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      right: ManagerMargin.v8,
                      left: ManagerMargin.v8,
                      top: ManagerMargin.h8,
                      bottom: ManagerMargin.h8,
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        baseText(
                          name: product.productName,
                          fontSize: ManagerFontSizes.s14,
                        ),
                        SizedBox(
                          height: ManagerHeights.h8,
                        ),
                        baseText(
                          name: product.brand,
                          fontSize: ManagerFontSizes.s14,
                          color: ManagerColors.black,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ManagerMargin.v8,
                        ),
                        child: Row(
                          children: [
                            baseText(
                              name: '\$${product.sellingPrice}',
                              decoration: TextDecoration.lineThrough,
                              color: ManagerColors.grey,
                              visible: product.discountPrice != 0 ? true : false,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            baseText(
                              name: product.discountPrice != 0
                                  ? "\$${(product.sellingPrice - (product.sellingPrice * product.discountPrice) / 100).round()}"
                                  : "\$${product.sellingPrice}",
                              fontSize: ManagerFontSizes.s18,
                              color: ManagerColors.primaryColor,
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
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(ManagerRadius.r12),
                              bottomLeft: Radius.circular(ManagerRadius.r12),
                            ),
                          ),
                          child: IconButton(
                            icon: HeroIcon(
                              HeroIcons.shoppingCart,
                              color: ManagerColors.primaryColor,
                            ),
                            onPressed: addToCart,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
