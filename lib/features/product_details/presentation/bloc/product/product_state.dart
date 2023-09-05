import 'package:equatable/equatable.dart';

class ProductStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class AddToCartState extends ProductStates {}

class AddToCartSuccessState extends ProductStates {}

class AddToCartFailedState extends ProductStates {
  final String message;

  AddToCartFailedState({required this.message});

  List<Object?> get props => [message];
}

class AddToFavouritesState extends ProductStates {}

class AddToFavouritesSuccessState extends ProductStates {}

class AddToFavouritesFailedState extends ProductStates {
  final String message;

  AddToFavouritesFailedState({required this.message});

  List<Object?> get props => [message];
}