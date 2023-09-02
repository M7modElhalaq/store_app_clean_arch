import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:get/get.dart';
import 'package:store_app/core/widgets/navigate_push.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';
import 'package:store_app/features/auth/domain/use_cases/login.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/otp_view.dart';
import 'package:store_app/features/profile/presentation/views/complete_profile_view.dart';
import 'package:store_app/routes/routes.dart';

class AuthController extends GetxController with Helpers {
  late AppSettingsSharedPreferences appSettingsSharedPreferences;

  final LoginUseCase login;

  Customer? customer;

  late TextEditingController controller;
  late String initialCountry;
  late PhoneNumber number;
  late FirebaseAuth auth;
  final formKey = GlobalKey<FormState>();

  AuthController({required this.login});

  @override
  void onInit() {
    super.onInit();
    appSettingsSharedPreferences = AppSettingsSharedPreferences();
    controller = TextEditingController();
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
    print('Phone Number: $phoneNumber');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (e) {
        print('verificationFailed');
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
            error: true,
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
          update();
        } else {
          print('Registered: $phoneNumber');
          appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, Routes.completeProfileView, arguments: {
            'phoneNumber': phoneNumber,
          });
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
}