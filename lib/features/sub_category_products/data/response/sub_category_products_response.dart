import 'package:json_annotation/json_annotation.dart';

import 'sub_category_products_data_response.dart';

part 'sub_category_products_response.g.dart';

@JsonSerializable()
class SubCategoryResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'sub_category_name')
  String? subCategoryName;
  @JsonKey(name: 'data')
  List<SubCategoryDataResponse>? data;

  SubCategoryResponse(
      {this.success, this.message, this.subCategoryName, this.data});

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubCategoryResponseToJson(this);
}