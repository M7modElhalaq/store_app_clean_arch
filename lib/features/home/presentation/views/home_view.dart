import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/error_container.dart';
import 'package:store_app/core/widgets/product_widget.dart';
import 'package:store_app/features/home/presentation/controller/home_controller.dart';
import 'package:store_app/features/home/presentation/widgets/empty_products_widget.dart';
import 'package:store_app/features/home/presentation/widgets/products_types_bar.dart';
import 'package:store_app/features/home/presentation/widgets/search_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
              appBar: AppBar(
                elevation: Constance.appBarElevation,
                backgroundColor: ManagerColors.white,
                leading: Padding(
                  padding:
                  EdgeInsetsDirectional.only(start: ManagerWidth.w20),
                  child: InkWell(
                    onTap: () => SimpleHiddenDrawerController.of(context).toggle(),
                    child: Image.asset(
                      ManagerAssets.hiddenDrawerIcon,
                      color: ManagerColors.primaryColor,
                    ),
                  ),
                ),
                title: Center(
                  child: Text(ManagerStrings.homePageTitle),
                ),
                actions: [
                  Padding(
                    padding:
                    EdgeInsetsDirectional.only(end: ManagerWidth.w20),
                    child: IconButton(
                      icon: Stack(
                        children: [
                          const HeroIcon(
                            HeroIcons.bellAlert,
                          ),
                          Positioned(
                            // draw a red marble
                            top: 0.0,
                            right: 0.0,
                            child: Container(
                              height: ManagerHeights.h8,
                              width: ManagerWidth.w8,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ManagerColors.red,
                                borderRadius:
                                BorderRadius.circular(ManagerRadius.r12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  controller.isLoading = 0;
                  controller.getHomeData();
                },
                child: controller.isLoading == 2
                    ? SingleChildScrollView(
                  child: errorContainer(
                    controller.errorMessage,
                  ),
                )
                    : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w20,
                      vertical: ManagerHeights.h12,
                    ),
                    child: Column(
                      children: [
                        // Search Text Field
                        SearchTextField(
                          controller: controller.searchController,
                        ),
                        SizedBox(
                          height: ManagerHeights.h24,
                        ),
                        // Slider
                        SizedBox(
                          height: ManagerHeights.h150,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: PageView(
                                  controller: controller.pageController,
                                  onPageChanged: (int index) => controller.changeSlider(index),
                                  children: controller.slider(),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: ManagerHeights.h12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: controller.sliderIndicator(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeights.h24,
                        ),
                        Container(
                          height: ManagerHeights.h50,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(ManagerRadius.r20),
                            border: Border.all(
                              color: ManagerColors.borderColor,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              ProductsTypeBar(
                                isActive: controller.productTypeIndex == 0
                                    ? true
                                    : false,
                                title: ManagerStrings.offers,
                                onTap: () {
                                  controller.changeProductsBar(
                                      context, 0);
                                },
                              ),
                              ProductsTypeBar(
                                isActive: controller.productTypeIndex == 1
                                    ? true
                                    : false,
                                title: ManagerStrings.topSelling,
                                onTap: () {
                                  controller.changeProductsBar(
                                      context, 1);
                                },
                              ),
                              ProductsTypeBar(
                                isActive: controller.productTypeIndex == 2
                                    ? true
                                    : false,
                                title: ManagerStrings.newProducts,
                                onTap: () {
                                  controller.changeProductsBar(
                                      context, 2);
                                },
                              ),
                            ],
                          ),
                        ),
                        // Products
                        SizedBox(
                          height: ManagerHeights.h24,
                        ),
                        GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: controller.products != null
                                  ? (controller.products!.isNotEmpty
                                  ? 2
                                  : 1)
                                  : 1,
                              mainAxisExtent: 222,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                            ),
                            itemCount: controller.products != null
                                ? (controller.products!.isNotEmpty
                                ? controller.products!.length
                                : 1)
                                : 1,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder:
                                (BuildContext context, int index) {
                              if (controller.products!.isEmpty) {
                                return const EmptyProductsWidget();
                              } else {
                                var item = controller.products![index];
                                return ProductWidget(
                                  onTap: () => controller.productDetails(context, item.id),
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
                                      productIndex: item.id),
                                  addToCart: () => controller.addToCart(
                                      context,
                                      productIndex: item.id),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                )
              ),
            );
      },
    );
  }
}
