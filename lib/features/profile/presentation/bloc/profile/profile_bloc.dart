import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/profile/domain/entities/customer.dart';
import 'package:store_app/features/profile/domain/use_cases/get_customer_data.dart';
import 'package:store_app/features/profile/domain/use_cases/logout.dart';
import 'package:store_app/features/auth/domain/use_cases/register_profile.dart';
import 'package:store_app/features/profile/domain/use_cases/update_profile.dart';
import 'package:store_app/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:store_app/features/profile/presentation/bloc/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> with Helpers {
  final GetCustomerDataUseCase getData;
  final UpdateProfileUseCase updateProfile;
  final LogoutUseCase logoutUseCase;
  final RegisterProfileUseCase register;

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dayOfBirthController = TextEditingController();
  String selectedGender = '';

  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  Customer? customer;
  File? image;

  ProfileBloc({
    required this.getData,
    required this.register,
    required this.updateProfile,
    required this.logoutUseCase,
  }) : super(ProfileInitialState()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetUserDataEvent) {
        emit(ProfileLoadingState());
        final data = await getData();
        data.fold(
          (failure) {
            emit(GetUserDataErrorState(message: _mapFailureToMessage(failure)));
          },
          (r) {
            customer = r;
            emit(GetUserDataSuccessState());
          },
        );
      }
    });
  }

  void getCustomerData() async {
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
        emit(UpdateAccountErrorState(message: _mapFailureToMessage(failure)));
        success = false;
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
        emit(UpdateAccountSuccessState());
        success = true;
      },
    );
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
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
        ModalRoute.withName('/'),
      );
    });
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      emit(picProfileImage());
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
      emit(picProfileImage());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

// void getFromGallery() async {
//   PickedFile pickedFile = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     imageFile = File(pickedFile.path);
//   }
// }
//
// getFromCamera() async {
//   PickedFile pickedFile = await ImagePicker().getImage(
//     source: ImageSource.camera,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     imageFile = File(pickedFile.path);
//   }
// }

  void changeGender({required String value}) {
    print(value);
    selectedGender = value;
    emit(ChangeGenderState());
  }

  @override
  Future<void> close() {
    print('Bloc Close');
    return super.close();
  }
}
