import 'package:flutter/material.dart';
import 'package:store_app/core/strings/routes.dart';
import 'package:store_app/features/cart/presentation/views/cart_view.dart';
import 'package:store_app/features/favourites/presentation/views/favorites_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/main_app/presentation/views/main_app_view.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';
import 'package:store_app/features/shopping_bag/presentation/views/shopping_bag_view.dart';

import 'views/complete_profile_view.dart';
import '../features/auth/presentation/views/login_view.dart';
import '../splash_view.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    Routes.SPLASH_VIEW: (context) => const SplashView(),
    Routes.LOGIN_VIEW: (context) => const LoginView(),
    Routes.COMPLETE_PROFILE_VIEW: (context) => CompleteProfileView(phoneNumber: 970599999999,),
    Routes.MAIN_APP_VIEW: (context) => const MainAppView(),
    Routes.HOME_VIEW: (context) => HomeView(),
    Routes.FAVOURITES_VIEW: (context) => const FavouritesView(),
    Routes.CART_VIEW: (context) => const CartView(),
    Routes.SHOPPINGBAG_VIEW: (context) => const ShoppingBagView(),
    Routes.PROFILE_VIEW: (context) => const ProfileView(),
  };
}
