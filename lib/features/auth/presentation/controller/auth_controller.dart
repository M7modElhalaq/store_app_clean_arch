import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:get/get.dart';
import 'package:store_app/core/widgets/navigate_push.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';

import '../../../../config/dependancy_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../routes/routes.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/register_profile.dart';
import '../../domain/entities/customer.dart';

class AuthController extends GetxController with Helpers {
  late AppSettingsSharedPreferences appSettingsSharedPreferences;
  CacheData cache = CacheData();

  LoginUseCase loginUseCase = sl<LoginUseCase>();

  final RegisterProfileUseCase register;

  Customer? customer;

  late TextEditingController controller;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController idController;
  late TextEditingController dayOfBirthController;
  String? selectedGender;
  late String initialCountry;
  late PhoneNumber number;
  late FirebaseAuth auth;
  File? image;
  late String otpCode;
  late String verificationId;
  late int phoneNumber;
  int numberPh = 0;

  AuthController(this.loginUseCase, {required this.register});

  @override
  void onInit() {
    super.onInit();
    appSettingsSharedPreferences = AppSettingsSharedPreferences();
    controller = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    idController = TextEditingController();
    dayOfBirthController = TextEditingController();
    selectedGender = '';
    Constance.loginInitialCountry;
    number = PhoneNumber(isoCode: Constance.loginInitialCountry);
    auth = FirebaseAuth.instance;
  }

  @override
  void onClose() {
    controller.clear();
    Constance.loginInitialCountry;
    super.onClose();
  }

  void signInWithPhone() async {
    BuildContext context = Get.context!;
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
    appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
    (await loginUseCase
        .execute(LoginUseCaseInput(phoneNumber: phoneNumber)))
        .fold(
          (l) {
        showSnackBar(
          context: context,
          message: ManagerStrings.notRegisteredFailureMessage,
          error: true,
        );
      },
          (r) async {
        cache.setIsRegistered();
        showSnackBar(
          context: context,
          message: ManagerStrings.logoutSuccess,
        );
        appSettingsSharedPreferences.setToken(r.token.onNull());
      },
    );
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+${phoneNumber.toString()}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (e) {
        print(e);
        Navigator.of(context).pop();
        showSnackBar(
          context: context,
          message: ManagerStrings.checkPhoneNumber,
          error: true,
        );
        navigatePushWidget(
          context,
          materialPageRoute: MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
        update();
      },
      codeSent: (String verificationId, int? resendToken) async {
        print(verificationId);
        this.verificationId = verificationId;
        cache.setVerificationId(verificationId);
        Navigator.pushReplacementNamed(context, Routes.otpView);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void codeVerify() async {
    BuildContext context = Get.context!;
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
    // Create a PhoneAuthCredential with the code
    print("smsCode: $otpCode");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: cache.getVerificationId(), smsCode: otpCode);

    try {
      await auth.signInWithCredential(credential).then((value) {
        if (cache.getIsRegistered()) {
          appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
          appSettingsSharedPreferences.setLoggedIn();
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, Routes.mainAppView);
          showSnackBar(
            context: context,
            message: ManagerStrings.welcomeMessage,
          );
          update();
        } else {
          print('Registered: $phoneNumber');
          appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
          numberPh = phoneNumber;
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, Routes.registerView);
        }
        update();
      }).onError((error, stackTrace) {
        Navigator.of(context).pop();
        showSnackBar(
          context: context,
          message: ManagerStrings.wrongVerificationId,
        );
        update();
      });
    } catch (e) {
      Navigator.of(context).pop();
      showSnackBar(
        context: context,
        message: ManagerStrings.wrongVerificationId,
      );
      update();
    }
  }

  void registerCustomer(
    BuildContext context, {
    required int phoneNumber,
    String? profileImage,
    String? userName,
    String? email,
    int? idNumber,
    String? dayOfBirth,
    String? gender,
  }) async {
    Customer customer = Customer(
      name: userName ?? '',
      email: email ?? '',
      phoneNumber: phoneNumber,
      idNumber: idNumber ?? 0,
      profileImage: profileImage ?? '',
      dateOfBirth: dayOfBirth ?? '',
      gender: gender ?? '',
      id: 0,
    );

    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
    final verify = await register(customer);
    verify.fold(
      (failure) {
        showSnackBar(
            context: context,
            message: ManagerStrings.completeProfileUpdateFailed,
            error: true);
      },
      (customer) {
        showSnackBar(
          context: context,
          message: ManagerStrings.registerSuccess,
        );
        appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
        Navigator.pushReplacementNamed(context, Routes.mainAppView);
      },
    );
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

  void changeGender({required String value}) {
    print(value);
    selectedGender = value;
    update();
  }
}
