import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_fonts.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/product_color_widget.dart';
import 'package:store_app/core/widgets/product_size_widget.dart';
import 'package:store_app/core/widgets/text_button_widget.dart';
import 'package:store_app/routes/routes.dart';

import '../../../../core/widgets/shimmer/shimmer_product_details_page.dart';
import '../controller/product_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return controller.isLoading == 2
            ? Scaffold(
                appBar: AppBar(
                  elevation: Constance.appBarElevation,
                  backgroundColor: ManagerColors.white,
                  leading: IconButton(
                    icon: const HeroIcon(HeroIcons.chevronRight),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.mainAppView);
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: HeroIcon(
                        HeroIcons.heart,
                        style: controller.product.data.inFavorites
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                        color: controller.product.data.inFavorites
                            ? ManagerColors.red
                            : ManagerColors.primaryColor,
                      ),
                      onPressed: () => controller.addToFav(context, productIndex: controller.product.data.id),
                    ),
                    IconButton(
                      icon: const HeroIcon(HeroIcons.shoppingBag),
                      onPressed: () => controller.addToCart(context,
                            productIndex: controller.product.data.id),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: ManagerHeights.h280,
                        color: ManagerColors.productImageBackgroundColor,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: ManagerMargin.h48,
                              vertical: ManagerMargin.v24),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: PageView(
                                  controller: controller.pageController,
                                  onPageChanged: (int index) => controller
                                      .onPageSliderImageChanged(index),
                                  children: controller.imagesList(),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ManagerHeights.h12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: controller.imagesIndicator(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(ManagerMargin.h24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                baseText(
                                  name: controller.product.data.productNameAr,
                                  fontWeight: ManagerFontWeight.bold,
                                  fontSize: ManagerFontSizes.s24,
                                  color: ManagerColors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: ManagerMargin.v8,
                                  ),
                                  child: Row(
                                    children: [
                                      baseText(
                                        name:
                                            '\$${controller.product.data.sellingPrice}',
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: ManagerFontWeight.bold,
                                        color: ManagerColors.grey,
                                        visible: controller.product.data
                                                    .discountPrice !=
                                                0
                                            ? true
                                            : false,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      baseText(
                                        name: controller.product.data
                                                    .discountPrice !=
                                                0
                                            ? "\$${controller.product.data.discount * controller.qty}"
                                            : "\$${controller.product.data.sellingPrice}",
                                        fontSize: ManagerFontSizes.s18,
                                        fontWeight: ManagerFontWeight.bold,
                                        color: ManagerColors.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ManagerHeights.h12,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: ManagerHeights.h12),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: ManagerColors.borderColor,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  baseText(
                                    name: controller.product.data.brandAr,
                                    color: ManagerColors.grey,
                                    fontWeight: ManagerFontWeight.bold,
                                  ),
                                  Visibility(
                                    visible:
                                        controller.product.data.productQty > 1,
                                    replacement: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: ManagerWidth.w8),
                                      child: baseText(
                                        name: ManagerStrings.noQty,
                                        color: ManagerColors.black,
                                        fontSize: ManagerFontSizes.s20,
                                        fontWeight: ManagerFontWeight.bold,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () => controller.decreaseQty(),
                                          child: Container(
                                            width: ManagerWidth.w24,
                                            height: ManagerHeights.h24,
                                            decoration: BoxDecoration(
                                              color: controller.qty == 1
                                                  ? ManagerColors.primaryColor
                                                      .withOpacity(.5)
                                                  : ManagerColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ManagerRadius.r8),
                                            ),
                                            alignment: Alignment.center,
                                            child: baseText(
                                              name: '-',
                                              color: ManagerColors.white,
                                              fontWeight:
                                                  ManagerFontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: ManagerWidth.w8),
                                          child: baseText(
                                            name: '${controller.qty}',
                                            color: ManagerColors.black,
                                            fontSize: ManagerFontSizes.s20,
                                            fontWeight: ManagerFontWeight.bold,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => controller.increaseQty(),
                                          child: Container(
                                            width: ManagerWidth.w24,
                                            height: ManagerHeights.h24,
                                            decoration: BoxDecoration(
                                              color: ManagerColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ManagerRadius.r8),
                                            ),
                                            alignment: Alignment.center,
                                            child: baseText(
                                              name: '+',
                                              color: ManagerColors.white,
                                              fontWeight:
                                                  ManagerFontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ManagerHeights.h16,
                            ),
                            baseText(
                              name: ManagerStrings.colors,
                              fontWeight: ManagerFontWeight.bold,
                              fontSize: ManagerFontSizes.s16,
                              color: ManagerColors.black,
                            ),
                            SizedBox(
                              height: ManagerHeights.h12,
                            ),
                            Container(
                              height: ManagerHeights.h60,
                              padding: const EdgeInsets.symmetric(
                                vertical: ManagerMargin.v12,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: ManagerColors.borderColor,
                                  ),
                                ),
                              ),
                              child: ListView.builder(
                                itemCount:
                                    controller.product.data.colors.isNotEmpty
                                        ? controller.product.data.colors.length
                                        : 1,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  if (controller
                                      .product.data.colors.isNotEmpty) {
                                    final buffer = StringBuffer();
                                    buffer.write('ff');
                                    buffer.write(controller
                                        .product.data.colors[index]
                                        .replaceFirst('#', ''));
                                    return ProductColorWidget(
                                      color: int.parse(buffer.toString(),
                                          radix: 16),
                                      isSelected: controller.selectedColor == index,
                                      onTap: () => controller
                                          .addOrDeleteFromSelectedColors(index),
                                    );
                                  } else {
                                    return baseText(
                                      name: ManagerStrings.noColors,
                                      color: ManagerColors.black,
                                      fontWeight: ManagerFontWeight.regular,
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: ManagerHeights.h16,
                            ),
                            baseText(
                              name: ManagerStrings.sizes,
                              fontWeight: ManagerFontWeight.bold,
                              fontSize: ManagerFontSizes.s16,
                              color: ManagerColors.black,
                            ),
                            SizedBox(
                              height: ManagerHeights.h12,
                            ),
                            Container(
                              height: ManagerHeights.h60,
                              padding: const EdgeInsets.symmetric(
                                vertical: ManagerMargin.v12,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: ManagerColors.borderColor,
                                  ),
                                ),
                              ),
                              child: ListView.builder(
                                itemCount: controller.sizes.isNotEmpty
                                    ? controller.sizes.length - 1
                                    : 1,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  if (controller.sizes.isNotEmpty) {
                                    return ProductSizeWidget(
                                      size: controller.sizes[index],
                                      isSelected: controller.selectedSize == index,
                                      onTap: () => controller
                                          .addOrDeleteFromSelectedSizes(index),
                                    );
                                  } else {
                                    return baseText(
                                      name: ManagerStrings.noSizes,
                                      color: ManagerColors.black,
                                      fontWeight: ManagerFontWeight.bold,
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: ManagerHeights.h16,
                            ),
                            baseText(
                              name: ManagerStrings.description,
                              fontWeight: ManagerFontWeight.bold,
                              fontSize: ManagerFontSizes.s16,
                              color: ManagerColors.black,
                            ),
                            SizedBox(height: ManagerHeights.h12),
                            Container(
                              width: double.infinity,
                              child: Text(
                                controller.product.data.descriptionEn,
                                style: TextStyle(
                                  color: ManagerColors.grey,
                                  fontFamily: ManagerFont.appFont,
                                  fontWeight: ManagerFontWeight.w400,
                                  fontSize: ManagerFontSizes.s16,
                                ),
                              ),
                            ),
                            SizedBox(height: ManagerHeights.h24),
                            textButtonWidget(
                              text: ManagerStrings.pay,
                              isVisible: controller.product.data.productQty > 1,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            : const ShimmerProductDetailsPageList();
      },
    );
  }
}
