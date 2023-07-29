import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/strings/failures.dart';
import 'package:store_app/core/strings/messages.dart';
import 'package:store_app/features/auth/domain/use_cases/login.dart';
import 'package:store_app/features/auth/domain/use_cases/register_profile.dart';
import 'package:store_app/features/auth/domain/use_cases/verify_phone.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  final LoginUseCase login;
  final VerifyPhoneUseCase verifyPhone;
  final RegisterProfileUseCase register;

  LoginBloc({
    required this.login,
    required this.verifyPhone,
    required this.register,
  }) : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      if (event is CheckCustomerAccountEvent) {
        emit(LoginLoadingState());
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
        final accountType = event.account;
        final verify = await verifyPhone(event.phoneNumber);
        verify.fold(
          (failure) {
            emit(VerifyPhoneNumberErrorState(
                message: _mapFailureToMessage(failure)));
          },
          (customer) {
            emit(VerifyPhoneNumberSuccessState());
          },
        );
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
}
