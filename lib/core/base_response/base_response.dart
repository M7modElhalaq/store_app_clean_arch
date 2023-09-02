import 'package:json_annotation/json_annotation.dart';
import 'package:store_app/core/constance.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: ApiConstants.message)
  String? message;
}
