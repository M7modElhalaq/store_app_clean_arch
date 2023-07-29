import 'package:flutter/material.dart';
import 'package:store_app/core/layouts/style.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(color: defaultAppColor),
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
