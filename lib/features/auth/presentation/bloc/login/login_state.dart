import 'package:equatable/equatable.dart';

import '../../../domain/entities/customer.dart';

class LoginStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

// Check if customer already registered

class CheckCustomerAccountState extends LoginStates {}

class CheckCustomerAccountSuccessState extends LoginStates {
  final Customer customer;

  CheckCustomerAccountSuccessState({required this.customer});

  List<Object?> get props => [customer];
}

class CheckCustomerAccountErrorState extends LoginStates {
  final String message;

  CheckCustomerAccountErrorState({required this.message});

  List<Object?> get props => [message];
}

// Verify phone number

class VerifyPhoneNumberState extends LoginStates {}

class VerifyPhoneNumberSuccessState extends LoginStates {}

class VerifyPhoneNumberErrorState extends LoginStates {
  final String message;

  VerifyPhoneNumberErrorState({required this.message});
  List<Object?> get props => [message];
}

// Register new account for the customer

class RegisterAccountState extends LoginStates {}

class RegisterAccountSuccessState extends LoginStates {}

class RegisterAccountErrorState extends LoginStates {
  final String message;

  RegisterAccountErrorState({required this.message});
  List<Object?> get props => [message];
}