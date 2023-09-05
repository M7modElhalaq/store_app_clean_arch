
import 'package:json_annotation/json_annotation.dart';

part 'sliders_response.g.dart';

@JsonSerializable()
class SlidersResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title_ar')
  String? titleAr;
  @JsonKey(name: 'title_en')
  String? titleEn;
  @JsonKey(name: 'text_ar')
  String? textAr;
  @JsonKey(name: 'text_en')
  String? textEn;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  SlidersResponse(
      {this.id,
        this.titleAr,
        this.titleEn,
        this.textAr,
        this.textEn,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  factory SlidersResponse.fromJson(Map<String, dynamic> json) =>
      _$SlidersResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SlidersResponseToJson(this);
}