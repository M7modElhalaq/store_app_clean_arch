import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/config/locale/locale_settings.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_event.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'features/auth/presentation/bloc/login/login_event.dart';
import 'features/main_app/presentation/manager/drawer_cubit.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'core/layouts/theme/app_theme.dart';
import 'routes/routes.dart';

import 'config/injection_container.dart' as di;
import 'config/dependancy_injection.dart';

void main() async {
  await initModule();
  await di.init();
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<LoginBloc>()..add(CheckAuthEvent())),
          BlocProvider(create: (_) => di.sl<DrawerCubit>()),
          BlocProvider(
              create: (_) => di.sl<ProductBloc>()..add(GetProductsEvent())),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: ManagerStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: const Scaffold(),
          routes: routes(),
          initialRoute: Routes.splashView,
        ));
  }
}
