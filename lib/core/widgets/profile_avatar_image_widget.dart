import 'package:flutter/material.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_radius.dart';

class ProfileAvatarImageWidget extends StatelessWidget {
  String? image;
  var imagePicker;
  ImageProvider<Object>? backgroundImage;
  double? radius;

  ProfileAvatarImageWidget(
      {super.key,
      this.image,
      this.radius,
      this.imagePicker,
      this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? ManagerRadius.r64,
      backgroundColor: ManagerColors.white,
      backgroundImage: NetworkImage((image == null && imagePicker == null)
          ? ManagerAssets.defaultProfileImage
          :  '$image'),
      child: imagePicker != null
          ? Image.file(
            imagePicker,
          )
          : null,
    );
  }
}
