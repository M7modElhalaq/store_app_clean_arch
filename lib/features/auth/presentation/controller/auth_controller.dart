import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:get/get.dart';
import 'package:store_app/core/widgets/navigate_push.dart';
import 'package:store_app/features/auth/domain/use_cases/login.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/otp_view.dart';

import '../../../../routes/routes.dart';
import '../../domain/use_cases/register_profile.dart';
import '../../domain/entities/customer.dart';

class AuthController extends GetxController with Helpers {
  late AppSettingsSharedPreferences appSettingsSharedPreferences;

  final LoginUseCase login;
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
  final formKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  File? image;
  String? otpCode;
  int numberPh = 0;

  AuthController({required this.login, required this.register});

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

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
    final checkAccount = await login(int.parse(phoneNumber));
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (e) {
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
        // emit(CheckCustomerAccountErrorState(message: 'Not Registered'));
        checkAccount.fold((failure) {
          Navigator.of(context).pop();
          showSnackBar(
            context: context,
            message: ManagerStrings.checkPhoneNumber,
          );
          navigatePushWidget(
            context,
            materialPageRoute: MaterialPageRoute(
              builder: (context) => OtpView(
                phoneNumber: phoneNumber,
                isRegistered: false,
                verificationId: verificationId,
              ),
            ),
          );
        }, (cust) {
          customer = cust;
          Navigator.of(context).pop();
          showSnackBar(
            context: context,
            message: ManagerStrings.phoneVerifiedSuccess,
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OtpView(
                  phoneNumber: phoneNumber,
                  isRegistered: true,
                  verificationId: verificationId,
                ),
              ));
          update();
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void codeVerify(
      BuildContext context, {
        required String verificationId,
        required String smsCode,
        required int phoneNumber,
        bool isRegistered = false,
      }) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
    print('Code Verify: $verificationId');
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    try {
      await auth.signInWithCredential(credential).then((value) {
        if (isRegistered) {
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

  void registerCustomer(BuildContext context, {
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
                message: ManagerStrings
                    .completeProfileUpdateFailed,
                error: true);
      },
          (customer) {
            showSnackBar(
                context: context,
                message: ManagerStrings
                    .registerSuccess,);
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