import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/shimmer/shimmer_shopping_bag_page.dart';
import 'package:store_app/features/shopping_bag/presentation/controller/shopping_bag_controller.dart';

class ShoppingBagView extends StatelessWidget {
  const ShoppingBagView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingBagController>(builder: (controller) {
      return controller.isLoading == 0
          ? const ShimmerShoppingBagPageList()
          : Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(ManagerStrings.shoppingBagTitle),
                ),
                backgroundColor: ManagerColors.white,
              ),
              body: controller.isLoading == 2
                  ? Center(
                      child: Text(controller.errorMessage),
                    )
                  : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                    child: Column(
                        children: [
                          SizedBox(
                            height: ManagerHeights.h12,
                          ),
                          Container(
                            height: ManagerHeights.h60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: BorderDirectional(
                                top: BorderSide(color: ManagerColors.borderColor),
                                bottom:
                                    BorderSide(color: ManagerColors.borderColor),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => controller.changePageIndex(0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.pageIndex == 0
                                            ? ManagerColors.primaryColor
                                            : ManagerColors.white,
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r30),
                                      ),
                                      child: Center(
                                        child: baseText(
                                          name: ManagerStrings
                                              .shoppingBagOrdersOnProcess,
                                          color: controller.pageIndex == 0
                                              ? ManagerColors.white
                                              : ManagerColors.primaryColor,
                                          fontSize: ManagerFontSizes.s14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => controller.changePageIndex(1),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.pageIndex == 1
                                            ? ManagerColors.primaryColor
                                            : ManagerColors.white,
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r30),
                                      ),
                                      child: Center(
                                        child: baseText(
                                          name: ManagerStrings
                                              .shoppingBagOrdersOnDeliver,
                                          color: controller.pageIndex == 1
                                              ? ManagerColors.white
                                              : ManagerColors.primaryColor,
                                          fontSize: ManagerFontSizes.s14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => controller.changePageIndex(2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.pageIndex == 2
                                            ? ManagerColors.primaryColor
                                            : ManagerColors.white,
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r30),
                                      ),
                                      child: Center(
                                        child: baseText(
                                          name: ManagerStrings
                                              .shoppingBagOrdersDone,
                                          color: controller.pageIndex == 2
                                              ? ManagerColors.white
                                              : ManagerColors.primaryColor,
                                          fontSize: ManagerFontSizes.s14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => controller.changePageIndex(3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.pageIndex == 3
                                            ? ManagerColors.primaryColor
                                            : ManagerColors.white,
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r30),
                                      ),
                                      child: Center(
                                        child: baseText(
                                          name: ManagerStrings
                                              .shoppingBagOrdersCanceled,
                                          color: controller.pageIndex == 3
                                              ? ManagerColors.white
                                              : ManagerColors.primaryColor,
                                          fontSize: ManagerFontSizes.s14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: ManagerHeights.h24, horizontal: ManagerWidth.w24,),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.orders.isEmpty ? 1 : controller.orders.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if(controller.orders.isNotEmpty) {
                                  var item = controller.orders[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: ManagerHeights.h24),
                                    child: Container(
                                      height: ManagerHeights.h80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ManagerColors.borderColor,
                                        ),
                                        borderRadius: BorderRadius.circular(ManagerRadius.r12),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w12),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            baseText(
                                                name: "#${item.id}"
                                            ),
                                            HeroIcon(
                                                HeroIcons.chevronDown
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Text(ManagerStrings.noData),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                  ));
    });
  }
}
