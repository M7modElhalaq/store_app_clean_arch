import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/features/profile/domain/entities/customer.dart';
import 'package:store_app/features/profile/domain/use_cases/get_customer_data.dart';
import 'package:store_app/features/profile/domain/use_cases/logout.dart';
import 'package:store_app/features/profile/domain/use_cases/register_profile.dart';
import 'package:store_app/features/profile/domain/use_cases/update_profile.dart';
import 'package:store_app/routes/routes.dart';

class ProfileController extends GetxController with Helpers {
  final GetCustomerDataUseCase getData;
  final UpdateProfileUseCase updateProfile;
  final LogoutUseCase logoutUseCase;
  final RegisterProfileUseCase register;
  late int phoneNumber;

  final formKey = GlobalKey<FormState>();

  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController idController;
  late TextEditingController dayOfBirthController;
  late String selectedGender;

  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  Customer? customer;
  File? image;
  bool isLoading = false;

  ProfileController({
    required this.getData,
    required this.updateProfile,
    required this.logoutUseCase,
    required this.register,
  });

  @override
  void onInit() async {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    idController = TextEditingController();
    dayOfBirthController = TextEditingController();
    selectedGender = '';
    phoneNumber = appSettingsSharedPreferences.defaultPhoneNumber;

    isLoading = true;
    update();

    await getCustomerData();
    isLoading = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ManagerStrings.serverFailureMessage;
      case EmptyCacheFailure:
        return ManagerStrings.emptyCacheFailureMessage;
      case OfflineFailure:
        return ManagerStrings.offlineFailureMessage;
      case NotLoggedInFailure:
        return ManagerStrings.notLoggedInFailureMessage;
      case NotRegisteredFailure:
        return ManagerStrings.notRegisteredFailureMessage;
      case NotVerifiedFailure:
        return ManagerStrings.notVerifiedFailureMessage;
      case RegisterFailure:
        return ManagerStrings.redirectMessage;
      default:
        return "حصل خطأ, يرجي المحاولة لاحقا";
    }
  }

  Future<void> getCustomerData() async {
    final data = await getData();
    data.fold(
          (failure) {
        print(failure);
      },
          (r) {
        customer = r;
      },
    );
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
      lang: 'ar',
      token: '',
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
        print('RegisterAccountErrorState');
        print(failure);

      },
          (customer) {
        print('From Bloc: RegisterAccountSuccessState');
        print('Registered: $phoneNumber');
        appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
      },
    );
    update();
  }

  Future<bool> updateCustomer(BuildContext context,
      {required int phoneNumber,
        String? profileImage,
        String? userName,
        String? email,
        int? idNumber,
        String? dayOfBirth,
        String? gender}) async {
    Customer customer = Customer(
      name: userName ?? '',
      email: email ?? '',
      phoneNumber: phoneNumber,
      idNumber: idNumber ?? 0,
      profileImage: profileImage ?? '',
      dateOfBirth: dayOfBirth ?? '',
      gender: gender ?? '',
      lang: appSettingsSharedPreferences.defaultLocale,
      token: '',
    );

    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
    final verify = await updateProfile(customer, image);
    bool success = false;
    verify.fold(
          (failure) {
        print(failure);
        Navigator.of(context).pop();
        showSnackBar(
          context: context,
          message: ManagerStrings.completeProfileUpdateFailed,
          error: true,
        );
        success = false;
        update();
      },
          (cust) {
        getCustomerData();
        Navigator.of(context).pop();
        image = null;
        this.customer = cust;
        appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
        appSettingsSharedPreferences.setLoggedIn();
        showSnackBar(
          context: context,
          message: ManagerStrings.completeProfileUpdateSuccess,
        );
        success = true;
      },
    );
    update();
    return success;
  }

  void logout(BuildContext context) async {
    print('Logout From Bloc');
    final logout = await logoutUseCase();
    print(logout);
    logout.fold((l) {
      print('failed');
    }, (r) {
      showSnackBar(
        context: context,
        message: ManagerStrings.logoutSuccess,
      );
      Get.offAllNamed(Routes.loginView);
    });
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
