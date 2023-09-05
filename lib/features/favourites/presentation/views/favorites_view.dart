import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/features/favourites/presentation/controller/favorites_controller.dart';

import '../../../../core/widgets/base_text_widget.dart';
import '../../../../core/widgets/product_widget.dart';
import '../../../../core/widgets/shimmer/shimmer_favorites_page.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(builder: (controller) {
      return controller.isLoading == 1
          ? const ShimmerFavoritesPageList()
          : controller.isLoading == 0
              ? controller.product.data.length > 0 ?
      Scaffold(
        appBar: AppBar(
          elevation: Constance.appBarElevation,
          backgroundColor: ManagerColors.white,
          title: Center(
            child: baseText(
              name: ManagerStrings.favTitle,
              fontWeight: ManagerFontWeight.bold,
              fontSize: ManagerFontSizes.s20,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getFavoritesDetails();
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
                    "${controller.product.data.length} ${ManagerStrings.favProducts}",
                    fontSize: ManagerFontSizes.s18,
                    fontWeight: ManagerFontWeight.regular,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: ManagerHeights.h24,),
                  GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: controller.product.data != null
                            ? (controller.product.data.isNotEmpty
                            ? 2
                            : 1)
                            : 1,
                        mainAxisExtent: 222,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: controller.product.data != null
                          ? (controller.product.data.isNotEmpty
                          ? controller.product.data.length
                          : 1)
                          : 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (BuildContext context, int index) {
                        var item = controller.product.data[index];
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
        ),
      ) : Center(child: Text('No Data'),)
              : const Scaffold(
                  body: Center(
                    child: Text('Error Widget'),
                  ),
                );
    });
  }
}
