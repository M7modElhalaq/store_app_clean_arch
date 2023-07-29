import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/main_app/presentation/manager/drawer_cubit.dart';
import 'package:store_app/features/main_app/presentation/views/widgets/custom_drawer.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  @override
  Widget build(BuildContext context) {
    Widget body = const HomeView();

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('ss'),
      ),
      body: BlocConsumer<DrawerCubit, DrawerState>(
        builder: (context, state) {
          if (state is DrawerNavigated) {
            return body;
          }
          return const HomeView();
        },
        listener: (context, state) {
          if (state is DrawerNavigated) {
            body = state.screen;
          }
        },
      ),
    );
  }
}
