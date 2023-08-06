import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/layouts/style.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/routes.dart';
import 'package:store_app/features/cart/presentation/views/cart_view.dart';
import 'package:store_app/features/favourites/presentation/views/favorites_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/main_app/presentation/manager/drawer_cubit.dart';
import 'package:store_app/features/main_app/presentation/views/widgets/custom_drawer.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';
import 'package:store_app/features/shopping_bag/presentation/views/shopping_bag_view.dart';

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

  List<String> _pagesTitles = [
    'أهلا وسهلا',
    'المفضلة',
    'سلة المشتريات',
    'طلباتي',
    'حسابي',
  ];

  @override
  Widget build(BuildContext context) {
    Widget body = HomeView();

    return Scaffold(
      drawer: const CustomDrawer(),
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
          child: Text(_pagesTitles[_selectedIndex]),
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
      body: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          if (state is DrawerNavigated) {
            return body;
          }
          return _pages[_selectedIndex];
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w20,
          vertical: ManagerHeights.h24,
        ),
        height: ManagerHeights.h75,
        decoration: BoxDecoration(
            color: ManagerColors.white,
            borderRadius: BorderRadius.circular(ManagerRadius.r30),
            border: Border.all(color: ManagerColors.borderColor, width: 1)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ManagerRadius.r30),
          child: Directionality(
            textDirection: TextDirection.rtl,
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
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: HeroIcon(
                    HeroIcons.heart,
                    style: _selectedIndex == 1
                        ? HeroIconStyle.solid
                        : HeroIconStyle.outline,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  label: 'Shopping Cart',
                  icon: Stack(
                    children: [
                      HeroIcon(
                        HeroIcons.shoppingCart,
                        style: _selectedIndex == 2
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                      ),
                      Positioned(
                        // draw a red marble
                        top: 0.0,
                        right: 0.0,
                        child: Container(
                          height: ManagerHeights.h16,
                          width: ManagerWidth.w16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ManagerColors.red,
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r12),
                          ),
                          child: Text(
                            '10',
                            style: TextStyle(
                              color: ManagerColors.white,
                              fontSize: ManagerFontSizes.s10,
                              fontWeight: ManagerFontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomNavigationBarItem(
                  icon: HeroIcon(
                    HeroIcons.shoppingBag,
                    style: _selectedIndex == 3
                        ? HeroIconStyle.solid
                        : HeroIconStyle.outline,
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
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
