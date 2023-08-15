import 'package:equatable/equatable.dart';

class ProductStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class GetProductSuccessState extends ProductStates {}

class GetProductFailedState extends ProductStates {
  final String message;

  GetProductFailedState({required this.message});

  List<Object?> get props => [message];
}