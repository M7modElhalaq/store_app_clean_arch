import 'package:equatable/equatable.dart';

class ProfileStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class GetUserDataSuccessState extends ProfileStates {}

class GetUserDataErrorState extends ProfileStates {
  final String message;

  GetUserDataErrorState({required this.message});

  List<Object?> get props => [message];
}

class UserLogoutSuccessState extends ProfileStates {}

class UserLogoutErrorState extends ProfileStates {
  final String message;

  UserLogoutErrorState({required this.message});

  List<Object?> get props => [message];
}

class UserDeleteAccountSuccessState extends ProfileStates {}

class UserDeleteAccountErrorState extends ProfileStates {
  final String message;

  UserDeleteAccountErrorState({required this.message});

  List<Object?> get props => [message];
}


// Register new account for the customer

class RegisterAccountState extends ProfileStates {}

class RegisterAccountSuccessState extends ProfileStates {}

class RegisterAccountErrorState extends ProfileStates {
  final String message;

  RegisterAccountErrorState({required this.message});
  List<Object?> get props => [message];
}

class UpdateAccountSuccessState extends ProfileStates {}

class UpdateAccountErrorState extends ProfileStates {
  final String message;

  UpdateAccountErrorState({required this.message});
  List<Object?> get props => [message];
}

class picProfileImage extends ProfileStates {}

class ChangeGenderState extends ProfileStates {}