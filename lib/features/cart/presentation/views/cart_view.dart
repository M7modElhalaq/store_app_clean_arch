import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/resources/manager_width.dart';

import '../../../../core/resources/manager_radius.dart';
import '../../../../core/widgets/base_text_widget.dart';
import '../../../../core/widgets/shimmer/shimmer_favorites_page.dart';
import '../../../home/presentation/controller/home_controller.dart';
import '../controller/cart_controller.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  var homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return controller.isLoading == 1
          ? const ShimmerFavoritesPageList()
          : controller.isLoading == 0
              ? controller.products.data.isNotEmpty
                  ? Scaffold(
                      appBar: AppBar(
                        elevation: Constance.appBarElevation,
                        backgroundColor: ManagerColors.white,
                        title: Center(
                          child: baseText(
                            name: ManagerStrings.cartTitle,
                            fontWeight: ManagerFontWeight.bold,
                            fontSize: ManagerFontSizes.s20,
                          ),
                        ),
                      ),
                      body: RefreshIndicator(
                        onRefresh: () async {
                          controller.getCartData();
                        },
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.all(ManagerHeights.h24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                baseText(
                                  name:
                                      "${controller.products.data.length} ${ManagerStrings.favProducts}",
                                  fontSize: ManagerFontSizes.s18,
                                  fontWeight: ManagerFontWeight.regular,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: ManagerHeights.h24,
                                ),
                                GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisExtent: 150,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemCount: controller.products.data.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item =
                                          controller.products.data[index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ManagerColors.borderColor,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () => homeController.addToCart(context, productIndex: item.productId),
                                              icon: HeroIcon(
                                                HeroIcons.trash,
                                                color: ManagerColors.red,
                                              ),
                                            ),
                                            Container(
                                              height: ManagerHeights.h120,
                                              width: ManagerWidth.w100,
                                              padding: EdgeInsets.all(
                                                  ManagerWidth.w20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    ManagerRadius.r12),
                                                color: ManagerColors
                                                    .productImageBackgroundColor,
                                              ),
                                              child: Image.network(
                                                item.productThumbnail,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: ManagerWidth.w10,
                                                vertical: ManagerHeights.h30,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  baseText(
                                                    name: item.productName,
                                                    fontWeight:
                                                    ManagerFontWeight.bold,
                                                  ),
                                                  Row(
                                                    children: [
                                                      baseText(
                                                        name:
                                                        "${ManagerStrings.productSize}: ${item.productSize}",
                                                        fontSize:
                                                        ManagerFontSizes
                                                            .s14,
                                                      ),
                                                      SizedBox(
                                                        width: ManagerWidth.w6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          baseText(
                                                            name:
                                                            "${ManagerStrings.productColor}: ",
                                                            fontSize:
                                                            ManagerFontSizes
                                                                .s14,
                                                          ),
                                                          Container(
                                                            width: ManagerWidth
                                                                .w16,
                                                            height:
                                                            ManagerHeights
                                                                .h16,
                                                            decoration:
                                                            BoxDecoration(
                                                              color: ManagerColors
                                                                  .primaryColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: ManagerWidth.w140,
                                                    child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        baseText(
                                                          name:
                                                          "\$${item.productPrice}",
                                                          fontWeight:
                                                          ManagerFontWeight
                                                              .bold,
                                                          color: ManagerColors
                                                              .primaryColor,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () =>
                                                                  controller
                                                                      .decreaseQty(
                                                                      item),
                                                              child: Container(
                                                                width:
                                                                ManagerWidth
                                                                    .w24,
                                                                height:
                                                                ManagerHeights
                                                                    .h24,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: item.productQty ==
                                                                      1
                                                                      ? ManagerColors
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                      .5)
                                                                      : ManagerColors
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      ManagerRadius
                                                                          .r8),
                                                                ),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                child: baseText(
                                                                  name: '-',
                                                                  color:
                                                                  ManagerColors
                                                                      .white,
                                                                  fontWeight:
                                                                  ManagerFontWeight
                                                                      .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                  ManagerWidth
                                                                      .w8),
                                                              child: baseText(
                                                                name:
                                                                '${item.productQty}',
                                                                color:
                                                                ManagerColors
                                                                    .black,
                                                                fontSize:
                                                                ManagerFontSizes
                                                                    .s20,
                                                                fontWeight:
                                                                ManagerFontWeight
                                                                    .bold,
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () =>
                                                                  controller
                                                                      .increaseQty(
                                                                      item),
                                                              child: Container(
                                                                width:
                                                                ManagerWidth
                                                                    .w24,
                                                                height:
                                                                ManagerHeights
                                                                    .h24,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: ManagerColors
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      ManagerRadius
                                                                          .r8),
                                                                ),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                child: baseText(
                                                                  name: '+',
                                                                  color:
                                                                  ManagerColors
                                                                      .white,
                                                                  fontWeight:
                                                                  ManagerFontWeight
                                                                      .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text('No Data'),
                    )
              : const Scaffold(
                  body: Center(
                    child: Text('Error Widget'),
                  ),
                );
    });
  }
}
