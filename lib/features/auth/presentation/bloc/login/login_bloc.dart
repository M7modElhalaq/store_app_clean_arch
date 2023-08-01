import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/strings/failures.dart';
import 'package:store_app/core/strings/messages.dart';
import 'package:store_app/core/strings/routes.dart';
import 'package:store_app/core/widgets/navigate_push.dart';
import 'package:store_app/core/widgets/navigator_push_name_widget.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';
import 'package:store_app/features/auth/domain/use_cases/login.dart';
import 'package:store_app/features/auth/domain/use_cases/register_profile.dart';
import 'package:store_app/features/auth/domain/use_cases/verify_phone.dart';
import 'package:store_app/features/auth/presentation/views/otp_view.dart';

import '../../views/complete_profile_view.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  final LoginUseCase login;

  // final VerifyPhoneUseCase verifyPhone;
  final RegisterProfileUseCase register;
  FirebaseAuth auth = FirebaseAuth.instance;

  LoginBloc({
    required this.login,
    // required this.verifyPhone,
    required this.register,
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
          (customer) {
            emit(CheckCustomerAccountSuccessState(customer: customer));
          },
        );
      } else if (event is VerifyPhoneNumberEvent) {
        emit(LoginLoadingState());
        // final verify = await verifyPhone(event.phoneNumber);
        // verify.fold(
        //   (failure) {
        //     emit(VerifyPhoneNumberErrorState(
        //         message: _mapFailureToMessage(failure)));
        //   },
        //   (customer) {
        //     emit(VerifyPhoneNumberSuccessState());
        //   },
        // );
      } else if (event is RegisterNewCustomerEvent) {
        emit(LoginLoadingState());
        final verify = await register(event.customer);
        verify.fold(
          (failure) {
            emit(RegisterAccountErrorState(
                message: _mapFailureToMessage(failure)));
          },
          (customer) {
            emit(RegisterAccountSuccessState());
          },
        );
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case NotLoggedInFailure:
        return NOT_LOGGED_IN_FAILURE;
      case NotRegisteredFailure:
        return NOT_REGISTERED_FAILURE;
      case NotVerifiedFailure:
        return NOT_VERIFIED_FAILURE;
      case RegisterFailure:
        return REGISTERED_FAILURE;
      default:
        return "حصل خطأ, يرجي المحاولة لاحقا";
    }
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    emit(LoginLoadingState());
    final checkAccount = await login(int.parse(phoneNumber));
    print('Phone Number: $phoneNumber');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.trim(),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) async {
        // emit(CheckCustomerAccountErrorState(message: 'Not Registered'));
        checkAccount.fold((failure) {
          navigatePushWidget(
            context,
            materialPageRoute: MaterialPageRoute(
              builder: (context) => OtpView(
                  phoneNumber: phoneNumber,
                  isRegistered: false,
                  verificationId: verificationId),
            ),
          );
          emit(CheckCustomerAccountErrorState(
              message: _mapFailureToMessage(failure)));
        }, (customer) {
          navigatePushWidget(
            context,
            materialPageRoute: MaterialPageRoute(
              builder: (context) => OtpView(
                  phoneNumber: phoneNumber,
                  isRegistered: true,
                  verificationId: verificationId),
            ),
          );

          emit(CheckCustomerAccountSuccessState(customer: customer));
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
    emit(LoginLoadingState());
    print('Code Verify: $verificationId');
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    try {
      await auth.signInWithCredential(credential).then((value) {
        if (isRegistered) {
          // navigatePushNameWidget(route: Routes.MAIN_APP_VIEW, context: context);
          emit(VerifyPhoneNumberSuccessState());
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CompleteProfileView(
                phoneNumber: phoneNumber,
              ),
            ),
          );
        }
        print('From Bloc: VerifyPhoneNumberSuccessState');
        emit(VerifyPhoneNumberSuccessState());
      }).onError((error, stackTrace) {
        print('From Bloc: VerifyPhoneNumberErrorState');
        emit(VerifyPhoneNumberErrorState(message: 'رمز التحقق خاطي'));
      });
    } catch (e) {
      print('From Bloc: رمز التحقق');
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
        emit(RegisterAccountSuccessState());
      },
    );
  }
}
