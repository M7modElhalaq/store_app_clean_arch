import 'package:json_annotation/json_annotation.dart';

import 'home_data_response.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  HomeDataResponse? data;

  HomeResponse({this.status, this.message, this.data});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeResponseToJson(this);
}