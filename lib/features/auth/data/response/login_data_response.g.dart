// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) =>
    LoginDataResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profileImage: json['profileImage'] as String?,
      phoneNumber: json['phoneNumber'] as int?,
      idNumber: json['idNumber'] as int?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
      'idNumber': instance.idNumber,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'address': instance.address,
    };
