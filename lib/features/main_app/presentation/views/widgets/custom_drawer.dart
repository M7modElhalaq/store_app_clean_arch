import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/features/main_app/presentation/views/widgets/custom_drawer_list.dart';
import 'package:store_app/features/main_app/presentation/views/widgets/header_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ManagerColors.drawerBackgroundColor,
      child: const SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            HeaderDrawer(),
            CustomDrawerList(),
          ],
        ),
      ),
    );
  }
}
