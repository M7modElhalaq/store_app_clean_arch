import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_width.dart';

class SupportIconWidget extends StatelessWidget {
  void Function()? onTap;
  String image;
  SupportIconWidget({super.key, this.onTap, required this.image,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: ManagerHeights.h50,
        width: ManagerWidth.w50,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
