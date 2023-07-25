import 'package:flutter/material.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/splash_view.dart';

import 'core/layouts/theme/app_theme.dart';
import 'core/network/local/cache_helper.dart';
import 'core/routes.dart';
import 'core/strings/routes.dart';
import 'features/home/presentation/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await CacheHelper.init();
  //
  String initialRoute;
  //
  var splash = CacheHelper.getData(key: 'splash');
  uId = CacheHelper.getData(key: 'UID');
  if (splash == null) {
    initialRoute = Routes.SPLASH_VIEW;
  } else {
    if(uId != null) {
      initialRoute = Routes.HOME_VIEW;
    } else {
      initialRoute = Routes.LOGIN_VIEW;
    }
  }

  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(),
      routes: routes(),
      initialRoute: initialRoute,
    );
  }
}