import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/constance.dart';

import 'core/layouts/theme/app_theme.dart';
import 'core/network/local/cache_helper.dart';
import 'core/routes.dart';
import 'core/strings/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  //
  String initialRoute;
  //
  var splash = CacheHelper.getData(key: 'splash');
  uId = CacheHelper.getData(key: 'UID');
  if (splash == null) {
    initialRoute = Routes.SPLASH_VIEW;
  } else {
    if(uId == null || uId == '') {
      initialRoute = Routes.LOGIN_VIEW;
    } else {
      initialRoute = Routes.HOME_VIEW;
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