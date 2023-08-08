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