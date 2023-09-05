import 'package:json_annotation/json_annotation.dart';

import 'shopping_bag_data_response.dart';

part 'shopping_bag_response.g.dart';

@JsonSerializable()
class ShoppingBagResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  ShoppingBagDataResponse? data;

  ShoppingBagResponse({this.success, this.message, this.data});

  factory ShoppingBagResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingBagResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShoppingBagResponseToJson(this);
}