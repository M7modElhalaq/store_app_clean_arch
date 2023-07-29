import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/main_app/presentation/manager/drawer_cubit.dart';
import 'package:store_app/features/main_app/presentation/views/widgets/drawer_item_widget.dart';

class CustomDrawerList extends StatelessWidget {
  const CustomDrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          DrawerItem(
            id: 0,
            title: 'Home',
            icon: Icons.home,
            selected: context.watch<DrawerCubit>().currentSection ==
                    DrawerSections.home
                ? true
                : false,
          ),
          DrawerItem(
            id: 1,
            title: 'login',
            icon: Icons.home,
            selected: context.watch<DrawerCubit>().currentSection ==
                    DrawerSections.login
                ? true
                : false,
          ),
        ],
      ),
    );
  }
}
