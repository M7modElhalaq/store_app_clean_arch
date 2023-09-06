
import 'package:json_annotation/json_annotation.dart';

import 'login_data_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'data')
  LoginDataResponse? data;

  LoginResponse({this.success, this.message, this.token, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseToJson(this);
}