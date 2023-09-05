import 'package:json_annotation/json_annotation.dart';

import 'product_details_data_response.dart';
part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  ProductDetailsDataResponse? data;

  ProductDetailsResponse({this.success, this.message, this.data});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsResponseToJson(this);
}