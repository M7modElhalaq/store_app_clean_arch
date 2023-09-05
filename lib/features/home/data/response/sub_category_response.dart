
import 'package:json_annotation/json_annotation.dart';

part 'sub_category_response.g.dart';

@JsonSerializable()
class SubCategoryResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'name_en')
  String? nameEn;
  @JsonKey(name: 'name_ar')
  String? nameAr;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  SubCategoryResponse(
      {this.id,
        this.categoryId,
        this.nameEn,
        this.nameAr,
        this.createdAt,
        this.updatedAt});

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubCategoryResponseToJson(this);
}