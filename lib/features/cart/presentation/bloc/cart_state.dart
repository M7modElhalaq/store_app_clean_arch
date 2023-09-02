import 'package:equatable/equatable.dart';

class CartStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {}

class GetCartFailedState extends CartStates {
  final String message;

  GetCartFailedState({required this.message});

  List<Object?> get props => [message];
}

class AddItemToFavState extends CartStates{}