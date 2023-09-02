import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/features/cart/presentation/views/cart_view.dart';
import 'package:store_app/features/favourites/presentation/views/favorites_view.dart';
import 'package:store_app/features/home/presentation/controller/home_controller.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';
import 'package:store_app/features/shopping_bag/presentation/views/shopping_bag_view.dart';

import '../../../../core/widgets/shimmer/shimmer_home_page.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int _selectedIndex = 0;

  List<Widget> _pages = [
    HomeView(),
    FavouritesView(),
    CartView(),
    ShoppingBagView(),
    ProfileView()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = HomeView();

    return GetBuilder<HomeController>(builder: (controller) {
      return controller.isLoading == 1
          ? SimpleHiddenDrawer(
        typeOpen: TypeOpen.FROM_RIGHT,
        slidePercent: 60.0,
        screenSelectedBuilder:
            (int position, SimpleHiddenDrawerController controller) {
          return Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: Container(
              margin: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w20,
                vertical: ManagerHeights.h24,
              ),
              height: ManagerHeights.h86,
              decoration: BoxDecoration(
                  color: ManagerColors.white,
                  borderRadius: BorderRadius.circular(ManagerRadius.r30),
                  border: Border.all(color: ManagerColors.borderColor, width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ManagerRadius.r30),
                child: BottomNavigationBar(
                  // elevation: Constance.appBarElevation,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,

                  unselectedIconTheme: IconThemeData(
                    color: ManagerColors.iconsColor,
                    size: ManagerIconSizes.s30,
                  ),
                  selectedIconTheme: IconThemeData(
                    color: ManagerColors.primaryColor,
                    size: ManagerIconSizes.s36,
                  ),
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: HeroIcon(
                        HeroIcons.home,
                        style: _selectedIndex == 0
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                        size: ManagerIconSizes.s30,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: HeroIcon(
                        HeroIcons.heart,
                        style: _selectedIndex == 1
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                        size: ManagerIconSizes.s30,
                      ),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      label: 'Shopping Cart',
                      icon: HeroIcon(
                        HeroIcons.shoppingCart,
                        style: _selectedIndex == 2
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                        size: ManagerIconSizes.s30,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: HeroIcon(
                        HeroIcons.shoppingBag,
                        style: _selectedIndex == 3
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                        size: ManagerIconSizes.s30,
                      ),
                      label: 'Shopping Bag',
                    ),
                    BottomNavigationBarItem(
                      icon: HeroIcon(
                        HeroIcons.user,
                        style: _selectedIndex == 4
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                      ),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.amber[800],
                  onTap: _onItemTapped,
                ),
              ),
            ),
          );
        },
        menu: Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: ManagerColors.drawerBackgroundColor,
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: ManagerWidth.w24),
                width: ManagerWidth.w200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: controller.sliderContent(),
                ),
              ),
            ),
          ),
        ),
      )
          : const ShimmerResourceList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
