import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/features/main_app/presentation/manager/drawer_cubit.dart';

import 'core/layouts/theme/app_theme.dart';
import 'core/network/local/cache_helper.dart';
import 'core/routes.dart';
import 'core/strings/routes.dart';
import 'firebase_options.dart';

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
    if (uId == null || uId == '') {
      initialRoute = Routes.MAIN_APP_VIEW;
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
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: MaterialApp(
        title: 'Store App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routes: routes(),
        initialRoute: initialRoute,
      ),
    );
  }
}
