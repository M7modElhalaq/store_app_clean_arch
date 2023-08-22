import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/core/widgets/navigate_push.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';
import 'package:store_app/features/auth/domain/use_cases/login.dart';
import 'package:store_app/features/auth/domain/use_cases/logout.dart';
import 'package:store_app/features/auth/domain/use_cases/register_profile.dart';
import 'package:store_app/features/auth/domain/use_cases/update_profile.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/otp_view.dart';

import '../../../../profile/presentation/views/complete_profile_view.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> with Helpers {
  AppSettingsSharedPreferences appSettingsSharedPreferences = AppSettingsSharedPreferences();

  final LoginUseCase login;
  final UpdateProfileUseCase updateProfile;
  final LogoutUseCase logoutUseCase;
  Customer? customer;

  final TextEditingController controller = TextEditingController();
  String initialCountry = Constance.loginInitialCountry;
  PhoneNumber number = PhoneNumber(isoCode: Constance.loginInitialCountry);

  // final VerifyPhoneUseCase verifyPhone;
  final RegisterProfileUseCase register;
  FirebaseAuth auth = FirebaseAuth.instance;

  LoginBloc({
    required this.login,
    // required this.verifyPhone,
    required this.register,
    required this.updateProfile,
    required this.logoutUseCase,
  }) : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      if (event is CheckCustomerAccountEvent) {
        emit(LoginLoadingState());
        print('LoginLoadingState');
        final checkAccount = await login(event.phoneNumber);
        checkAccount.fold(
          (failure) {
            emit(CheckCustomerAccountErrorState(
                message: _mapFailureToMessage(failure)));
          },
          (cust) {
            customer = cust;
            emit(CheckCustomerAccountSuccessState(customer: cust));
          },
        );
      } else if (event is VerifyPhoneNumberEvent) {
        emit(LoginLoadingState());
      } else if (event is RegisterNewCustomerEvent) {
        emit(LoginLoadingState());
        final verify = await register(event.customer);
        verify.fold(
          (failure) {
            emit(RegisterAccountErrorState(
                message: _mapFailureToMessage(failure)));
          },
          (cust) {
            customer = cust;
            emit(RegisterAccountSuccessState());
          },
        );
      }
    });
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
          emit(CheckCustomerAccountErrorState(
              message: _mapFailureToMessage(failure)));
        }, (cust) {
          print('Registered');
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

          emit(CheckCustomerAccountSuccessState(customer: cust));
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
          emit(VerifyPhoneNumberSuccessState());
        } else {
          print('Registered: $phoneNumber');
          appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CompleteProfileView(
                phoneNumber: phoneNumber,
              ),
            ),
          );
        }
        emit(VerifyPhoneNumberSuccessState());
      }).onError((error, stackTrace) {
        Navigator.of(context).pop();
        showSnackBar(
          context: context,
          message: ManagerStrings.wrongVerificationId,
        );
        emit(VerifyPhoneNumberErrorState(message: 'رمز التحقق خاطي'));
      });
    } catch (e) {
      Navigator.of(context).pop();
      showSnackBar(
        context: context,
        message: ManagerStrings.wrongVerificationId,
      );
      emit(VerifyPhoneNumberErrorState(message: 'رمز التحقق خاطي'));
    }
  }

  void registerCustomer({
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

    emit(LoginLoadingState());
    final verify = await register(customer);
    verify.fold(
      (failure) {
        print('RegisterAccountErrorState');
        print(failure);

        emit(RegisterAccountErrorState(message: _mapFailureToMessage(failure)));
      },
      (customer) {
        print('From Bloc: RegisterAccountSuccessState');
        print('Registered: $phoneNumber');
        appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
        emit(RegisterAccountSuccessState());
      },
    );
  }

  Future<bool> updateCustomer(
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
      lang: 'ar',
      token: '',
    );

    emit(LoginLoadingState());
    final verify = await updateProfile(customer);
    bool success = false;
    verify.fold(
      (failure) {
        print(failure);
        showSnackBar(
          context: context,
          message: ManagerStrings.completeProfileUpdateFailed,
          error: true,
        );
        emit(UpdateAccountErrorState(message: _mapFailureToMessage(failure)));
        success = false;
      },
      (cust) {
        this.customer = cust;
        appSettingsSharedPreferences.setPhoneNumber(phoneNumber);
        appSettingsSharedPreferences.setLoggedIn();
        showSnackBar(
          context: context,
          message: ManagerStrings.completeProfileUpdateFailed,
          error: true,
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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
      emit(AuthFailedState(message: 'تم تسجيل الخروج بنجاح'));
    });
  }
}
