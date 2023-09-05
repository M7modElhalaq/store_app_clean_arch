import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/routes/routes.dart';

import '../../../../core/constance.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/base_text_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../../core/widgets/shimmer/shimmer_favorites_page.dart';
import '../controller/sub_category_controller.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubCategoryController>(builder: (controller) {
      return controller.isLoading == 1
          ? const ShimmerFavoritesPageList()
          : controller.isLoading == 0
              ? Scaffold(
                  appBar: AppBar(
                    elevation: Constance.appBarElevation,
                    backgroundColor: ManagerColors.white,
                    title: Center(
                      child: baseText(
                        name: controller.subCategoryModel.subCategoryName,
                        fontWeight: ManagerFontWeight.bold,
                        fontSize: ManagerFontSizes.s20,
                      ),
                    ),
                    leading: IconButton(
                      icon: const HeroIcon(
                        HeroIcons.chevronRight,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.mainAppView);
                      },
                    ),
                  ),
                  body: controller.subCategoryModel.data.isNotEmpty
                      ? RefreshIndicator(
                          onRefresh: () async {
                            controller.getSubCategoryData();
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
                                        "${controller.subCategoryModel.data.length} ${ManagerStrings.favProducts}",
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
                                        crossAxisCount: 2,
                                        mainAxisExtent: 222,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 5,
                                      ),
                                      itemCount: controller
                                          .subCategoryModel.data.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var item = controller
                                            .subCategoryModel.data[index];
                                        return ProductWidget(
                                          image: item.productThumbnail,
                                          productName: item.productName,
                                          brand: item.brand,
                                          inFavorites: item.inFavorites,
                                          inCart: item.inCart,
                                          isTrend: item.trend,
                                          newProduct: item.newProduct,
                                          discountPrice: item.discountPrice,
                                          sellingPrice: item.sellingPrice,
                                          addToFav: () => controller.addToFav(
                                              context,
                                              productIndex: index),
                                          addToCart: () => controller.addToCart(
                                              context,
                                              productIndex: index),
                                        );
                                      })
                                ],
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('No Data'),
                        ),
                )
              : const Scaffold(
                  body: Center(
                    child: Text('Error Widget'),
                  ),
                );
    });
  }
}
