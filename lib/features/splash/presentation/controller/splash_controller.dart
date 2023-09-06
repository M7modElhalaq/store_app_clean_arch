import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/routes/routes.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin  {
  AppSettingsSharedPreferences appSettingsSharedPreferences = AppSettingsSharedPreferences();

  // double opacityLevel = .3;
  late final AnimationController controller;

  late final Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: Constance.splashTime), () {
      // appSettingsSharedPreferences.clear();
      String route = appSettingsSharedPreferences.loggedIn
          ? Routes.mainAppView
          : Routes.loginView;
      print(route);
      Get.offAllNamed(route);
    });

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  }


  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}