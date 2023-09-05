class SubCategoryModel {
  int id;
  int categoryId;
  String nameEn;
  String nameAr;
  String createdAt;
  String updatedAt;

  SubCategoryModel(
      {required this.id,
        required this.categoryId,
        required this.nameEn,
        required this.nameAr,
        required this.createdAt,
        required this.updatedAt});
}