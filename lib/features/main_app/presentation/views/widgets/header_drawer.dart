import 'package:flutter/material.dart';
import 'package:store_app/core/layouts/style.dart';
import 'package:store_app/core/resources/manager_colors.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(color: ManagerColors.drawerBackgroundColor,),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.only(top: 20),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
