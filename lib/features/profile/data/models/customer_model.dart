
import 'package:store_app/features/profile/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.profileImage,
    required super.idNumber,
    required super.dateOfBirth,
    required super.gender,
    required super.lang,
    required super.token,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'] ?? 0,
      profileImage: json['profile_image'] ?? '',
      idNumber: json['id_number'] ?? 0,
      dateOfBirth: json['date_of_birth'] ?? '',
      gender: json['gender'] ?? '',
      lang: json['lang'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'idNumber': idNumber,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'lang': lang,
      'token': token
    };
  }
}
