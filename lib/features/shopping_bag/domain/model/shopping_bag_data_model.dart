import 'shopping_bag_data_orders_model.dart';

class ShoppingBagDataModel {
  List<ShoppingBagDataOrdersModel> onProgress;
  List<ShoppingBagDataOrdersModel> onDeliver;
  List<ShoppingBagDataOrdersModel> done;
  List<ShoppingBagDataOrdersModel> canceled;

  ShoppingBagDataModel({required this.onProgress, required this.onDeliver, required this.done, required this.canceled});
}