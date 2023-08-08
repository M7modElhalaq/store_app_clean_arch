import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';

class ProfileAvatarImageWidget extends StatelessWidget {
  String? image;
  double? radius;
  ProfileAvatarImageWidget({super.key, this.image, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? ManagerRadius.r64,
      backgroundColor: ManagerColors.white,
      backgroundImage: AssetImage(image ?? ManagerAssets.defaultProfileImage),
    );
  }
}
