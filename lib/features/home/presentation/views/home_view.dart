import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/loading_widget.dart';
import 'package:store_app/core/widgets/product_widget.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_event.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_state.dart';
import 'package:store_app/features/home/presentation/views/widgets/empty_products_widget.dart';
import 'package:store_app/features/home/presentation/views/widgets/products_types_bar.dart';
import 'package:store_app/features/home/presentation/views/widgets/search_text_field.dart';
import '../../../../core/resources/manager_font_sizes.dart';

import 'widgets/slider_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();
  late PageController _pageController;
  int _initialPage = 0;
  int _productTypeIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Constance.appBarElevation,
        backgroundColor: ManagerColors.white,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: ManagerWidth.w20),
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
                      borderRadius: BorderRadius.circular(ManagerRadius.r12),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        title: const Center(
          child: Text(ManagerStrings.homePageTitle),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: ManagerWidth.w20),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const HeroIcon(
                HeroIcons.listBullet,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductStates>(builder: (context, state) {
        var block = BlocProvider.of<ProductBloc>(context);
        var products = BlocProvider.of<ProductBloc>(context).products;
        // var offer = BlocProvider.of<ProductBloc>(context).offerProducts;
        // var topSelling = BlocProvider.of<ProductBloc>(context).topSellingProducts;
        // var newProduct = BlocProvider.of<ProductBloc>(context).newProducts;
        if (state is GetProductSuccessState) {
          return RefreshIndicator(
            onRefresh: () async {
              print('Refresh');
              BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w20,
                    vertical: ManagerHeights.h12,
                  ),
                  child: Column(
                    children: [
                      // Search Text Field
                      SearchTextField(
                        controller: searchController,
                      ),
                      const SizedBox(
                        height: ManagerHeights.h24,
                      ),
                      // Slider
                      Container(
                        height: ManagerHeights.h150,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          children: const [
                            SliderWidget(
                              index: 0,
                            ),
                            SliderWidget(
                              index: 1,
                            ),
                            SliderWidget(
                              index: 2,
                            ),
                            SliderWidget(
                              index: 3,
                            ),
                          ],
                        ),
                      ),
                      // Products App Bar
                      const SizedBox(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ProductsTypeBar(
                              isActive: block.productTypeIndex == 0 ? true : false,
                              title: ManagerStrings.offers,
                              onTap: () {
                                setState(() {
                                  block.changeProductsBar(0);
                                });
                              },
                            ),
                            ProductsTypeBar(
                              isActive: block.productTypeIndex == 1 ? true : false,
                              title: ManagerStrings.topSelling,
                              onTap: () {
                                setState(() {
                                  block.changeProductsBar(1);
                                });
                              },
                            ),
                            ProductsTypeBar(
                              isActive: block.productTypeIndex == 2 ? true : false,
                              title: ManagerStrings.newProducts,
                              onTap: () {
                                setState(() {
                                  block.changeProductsBar(2);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      // Products
                      const SizedBox(
                        height: ManagerHeights.h24,
                      ),
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: products!.isNotEmpty ? 2 : 1,
                            mainAxisExtent: 222,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5,
                          ),
                          itemCount: products.isNotEmpty ? products.length : 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            if(state is ChangeProductsLoadingState) {
                              return const LoadingWidget();
                            } else if(products.isEmpty) {
                              return const EmptyProductsWidget();
                            } else {
                              return ProductWidget(product: products[index]);
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const LoadingWidget();
        }
      }),
    );
  }
}
