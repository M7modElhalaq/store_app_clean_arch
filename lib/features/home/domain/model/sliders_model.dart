class SlidersModel {
  int id;
  String titleAr;
  String titleEn;
  String textAr;
  String textEn;
  String image;
  String createdAt;
  String updatedAt;
  String deletedAt;

  SlidersModel(
      {required this.id,
        required this.titleAr,
        required this.titleEn,
        required this.textAr,
        required this.textEn,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});
}