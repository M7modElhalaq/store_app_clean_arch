import 'package:json_annotation/json_annotation.dart';

import 'cart_data_response.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  List<CartDataResponse>? data;

  CartResponse({this.success, this.message, this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CartResponseToJson(this);
}

