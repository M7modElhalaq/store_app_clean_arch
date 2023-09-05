import 'package:flutter/material.dart';
import 'package:store_app/config/dependancy_injection.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/register_view.dart';
import 'package:store_app/features/product_details/presentation/view/product_view.dart';
import 'package:store_app/features/cart/presentation/views/cart_view.dart';
import 'package:store_app/features/favourites/presentation/views/favorites_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/main_app/presentation/views/main_app_view.dart';
import 'package:store_app/features/shopping_bag/presentation/views/shopping_bag_view.dart';
import 'package:store_app/features/sub_category_products/presentation/views/sub_category_view.dart';

import '../features/edit_profile/presentation/view/edit_profile_view.dart';
import '../features/settings/presentation/view/settings_view.dart';
import '../features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String loginView = '/login_view';
  static const String otpView = '/otp_view';
  static const String registerView = '/register_view';
  static const String mainAppView = '/main_app_view';
  static const String homeView = '/home_view';
  static const String favouritesView = '/favourites_view';
  static const String cartView = '/cart_view';
  static const String shoppingBagView = '/shopping_bag_view';
  static const String profileView = '/profile_view';
  static const String productView = '/product_view';
  static const String settingsView = '/settings_view';
  static const String subCategoryView = '/sub_category_view';
  static const String editProfileView = '/edit_profile_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginView:
        initAuth();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.mainAppView:
        initHome();
        return MaterialPageRoute(builder: (_) => const MainAppView());
      case Routes.homeView:
        initHome();
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.favouritesView:
        return MaterialPageRoute(builder: (_) => FavouritesView());
      case Routes.cartView:
        initCart();
        return MaterialPageRoute(builder: (_) => CartView());
      case Routes.shoppingBagView:
        return MaterialPageRoute(builder: (_) => const ShoppingBagView());
      case Routes.profileView:
        initProfile();
        return MaterialPageRoute(builder: (_) => const ProductView());
      case Routes.productView:
        initProduct();
        return MaterialPageRoute(builder: (_) => const ProductView());
      case Routes.settingsView:
        initSettings();
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case Routes.subCategoryView:
        initSubCategory();
        return MaterialPageRoute(builder: (_) => const SubCategoryView());
      case Routes.editProfileView:
        initEditProfile();
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(ManagerStrings.notFoundRoute),
            ),
          ),
    );
  }
}