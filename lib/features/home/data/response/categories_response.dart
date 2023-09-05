import 'package:json_annotation/json_annotation.dart';
import 'package:store_app/features/home/data/response/sub_category_response.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name_en')
  String? nameEn;
  @JsonKey(name: 'name_ar')
  String? nameAr;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'sub_category')
  List<SubCategoryResponse>? subCategory;

  CategoriesResponse(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.createdAt,
        this.updatedAt,
        this.subCategory});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CategoriesResponseToJson(this);
}