import 'package:flutter/material.dart';
import 'package:store_app/core/strings/routes.dart';
import 'package:store_app/features/auth/presentation/views/otp_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';

import '../features/auth/presentation/views/login_view.dart';
import '../splash_view.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    Routes.SPLASH_VIEW : (context) => SplashView(),
    Routes.HOME_VIEW : (context) => HomeView(),
    Routes.LOGIN_VIEW : (context) => LoginView(),
  };
}

