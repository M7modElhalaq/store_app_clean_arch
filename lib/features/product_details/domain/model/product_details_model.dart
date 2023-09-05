import 'product_details_data_model.dart';

class ProductDetailsModel {
  bool success;
  String message;
  ProductDetailsDataModel data;

  ProductDetailsModel({required this.success, required this.message, required this.data});
}