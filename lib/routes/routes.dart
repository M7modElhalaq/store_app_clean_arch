import 'package:flutter/material.dart';
import 'package:store_app/features/product/presentation/view/product_view.dart';
import 'package:store_app/features/cart/presentation/views/cart_view.dart';
import 'package:store_app/features/favourites/presentation/views/favorites_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/main_app/presentation/views/main_app_view.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';
import 'package:store_app/features/shopping_bag/presentation/views/shopping_bag_view.dart';

import '../features/profile/presentation/views/complete_profile_view.dart';
import '../features/auth/presentation/views/login_view.dart';
import '../features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String loginView = '/login_view';
  static const String otpView = '/otp_view';
  static const String completeProfileView = '/complete_profile_view';
  static const String mainAppView = '/main_app_view';
  static const String homeView = '/home_view';
  static const String favouritesView = '/favourites_view';
  static const String cartView = '/cart_view';
  static const String shoppingBagView = '/shopping_bag_view';
  static const String profileView = '/profile_view';
  static const String productView = '/product_view';
}

Map<String, Widget Function(BuildContext)> routes() {
  return {
    Routes.splashView: (context) => const SplashView(),
    Routes.loginView: (context) => const LoginView(),
    Routes.completeProfileView: (context) => CompleteProfileView(phoneNumber: 970599999999,),
    Routes.mainAppView: (context) => const MainAppView(),
    Routes.homeView: (context) => HomeView(),
    Routes.favouritesView: (context) => const FavouritesView(),
    Routes.cartView: (context) => const CartView(),
    Routes.shoppingBagView: (context) => const ShoppingBagView(),
    Routes.profileView: (context) => const ProfileView(),
    Routes.productView: (context) => const ProductView(),
  };
}
