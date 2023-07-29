import 'package:equatable/equatable.dart';

class AuthStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {}

class AuthFailedState extends AuthStates {
  final String message;

  AuthFailedState({required this.message});

  List<Object?> get props => [message];
}