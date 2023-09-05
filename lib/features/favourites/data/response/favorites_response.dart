import 'package:json_annotation/json_annotation.dart';

import 'favorites_data_response.dart';

part 'favorites_response.g.dart';

@JsonSerializable()
class FavoritesResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  List<FavoritesDataResponse>? data;

  FavoritesResponse({this.success, this.message, this.data});

  factory FavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FavoritesResponseToJson(this);
}