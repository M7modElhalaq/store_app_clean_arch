
import 'package:json_annotation/json_annotation.dart';

part 'login_data_response.g.dart';

@JsonSerializable()
class LoginDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'profileImage')
  String? profileImage;
  @JsonKey(name: 'phoneNumber')
  int? phoneNumber;
  @JsonKey(name: 'idNumber')
  int? idNumber;
  @JsonKey(name: 'dateOfBirth')
  String? dateOfBirth;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'address')
  String? address;

  LoginDataResponse(
      {this.id,
        this.name,
        this.email,
        this.profileImage,
        this.phoneNumber,
        this.idNumber,
        this.dateOfBirth,
        this.gender,
        this.address});

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginDataResponseToJson(this);
}