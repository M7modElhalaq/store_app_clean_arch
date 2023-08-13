import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/bloc/auth/auth_event.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'features/auth/presentation/bloc/login/login_event.dart';
import 'features/main_app/presentation/manager/drawer_cubit.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'core/layouts/theme/app_theme.dart';
import 'core/routes.dart';
import 'core/strings/routes.dart';

import 'config/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(
    initialRoute: Routes.SPLASH_VIEW,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<LoginBloc>()..add(CheckAuthEvent())),
          BlocProvider(
              create: (_) => di.sl<DrawerCubit>()),
        ],
        child: MaterialApp(
          title: 'Store App',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: Scaffold(),
          routes: routes(),
          initialRoute: initialRoute,
        ));
  }
}
