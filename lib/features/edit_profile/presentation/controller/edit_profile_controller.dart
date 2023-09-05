import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

class EditProfileController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController idController;
  late TextEditingController dayOfBirthController;
  late int phoneNumber;
  String? selectedGender;
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();
  final formKey = GlobalKey<FormState>();
  File? image;

  void onInit() async {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    idController = TextEditingController();
    dayOfBirthController = TextEditingController();
    selectedGender = '';
    phoneNumber = appSettingsSharedPreferences.defaultPhoneNumber;


    update();
  }

  void changeGender({required String value}) {
    print(value);
    selectedGender = value;
    update();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      update();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future openCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      update();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}