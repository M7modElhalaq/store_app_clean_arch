import 'package:store_app/features/home/domain/model/sub_category_model.dart';

class CategoriesModel {
  int id;
  String nameEn;
  String nameAr;
  String createdAt;
  String updatedAt;
  List<SubCategoryModel> subCategory;

  CategoriesModel(
      {required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.createdAt,
        required this.updatedAt,
        required this.subCategory});
}