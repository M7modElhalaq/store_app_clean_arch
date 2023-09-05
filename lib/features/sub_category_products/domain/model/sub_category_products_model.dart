import 'sub_category_products_data_model.dart';

class SubCategoryModel {
  bool success;
  String message;
  String subCategoryName;
  List<SubCategoryDataModel> data;

  SubCategoryModel(
      {required this.success, required this.message, required this.subCategoryName, required this.data});
}