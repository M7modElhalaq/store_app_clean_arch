import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/config/locale/locale_settings.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'core/layouts/theme/app_theme.dart';
import 'routes/routes.dart';

import 'config/dependancy_injection.dart';

void main() async {
  await initModule();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: localeSettings.locales,
      path: ManagerPaths.translationsPath,
      startLocale: localeSettings.defaultLocale,
      fallbackLocale: localeSettings.defaultLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(
          Constance.deviceWidth,
          Constance.deviceHeight,
        ),
        builder: (context, child) {
          return GetMaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: ManagerStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            initialRoute: Routes.splashView,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        });
  }
}
