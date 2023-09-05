import 'shopping_bag_data_order_product_model.dart';

class ShoppingBagDataOrdersModel {
  int id;
  String username;
  String address;
  int phone;
  List<ShoppingBagDataOrderProductModel> products;

  ShoppingBagDataOrdersModel({required this.id, required this.username, required this.address, required this.phone, required this.products});
}