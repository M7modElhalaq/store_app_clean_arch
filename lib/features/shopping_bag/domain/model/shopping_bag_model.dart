import 'shopping_bag_data_model.dart';

class ShoppingBagModel {
  bool success;
  String message;
  ShoppingBagDataModel data;

  ShoppingBagModel({required this.success, required this.message, required this.data});
}