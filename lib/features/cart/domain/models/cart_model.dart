import 'cart_data_model.dart';

class CartModel {
  bool success;
  String message;
  List<CartDataModel> data;

  CartModel({required this.success, required this.message, required this.data});
}

