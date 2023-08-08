import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/product_widget.dart';
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
        title: Center(
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
      body: SingleChildScrollView(
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
                TextFormField(
                  style: TextStyle(
                    color: ManagerColors.black,
                  ),
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: HeroIcon(
                      HeroIcons.magnifyingGlass,
                      color: ManagerColors.iconsColor,
                    ),
                    hintText: ManagerStrings.searchHint,
                    hintStyle: TextStyle(
                      color: ManagerColors.grey,
                      fontSize: ManagerFontSizes.s14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.borderColor),
                      borderRadius: BorderRadius.circular(ManagerRadius.r30),
                    ),
                  ),
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
                    borderRadius: BorderRadius.circular(ManagerRadius.r20),
                    border: Border.all(
                      color: ManagerColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: _productTypeIndex == 0
                              ? ManagerColors.primaryColor
                              : ManagerColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _productTypeIndex = 0;
                            });
                          },
                          child: baseText(
                            name: 'العروض',
                            color: _productTypeIndex == 0
                                ? ManagerColors.white
                                : ManagerColors.textColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: _productTypeIndex == 1
                              ? ManagerColors.primaryColor
                              : ManagerColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _productTypeIndex = 1;
                            });
                          },
                          child: baseText(
                            name: 'الأكثر مبيعا',
                            color: _productTypeIndex == 1
                                ? ManagerColors.white
                                : ManagerColors.textColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: _productTypeIndex == 2
                              ? ManagerColors.primaryColor
                              : ManagerColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _productTypeIndex = 2;
                            });
                          },
                          child: baseText(
                            name: 'وصل حديثا',
                            color: _productTypeIndex == 2
                                ? ManagerColors.white
                                : ManagerColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Products
                const SizedBox(
                  height: ManagerHeights.h24,
                ),
                GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                        mainAxisExtent: 222,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return const ProductWidget();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
