import 'package:store_app/features/auth/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.profileImage,
    required super.dateOfBirth,
    required super.gender,
    required super.lang,
    required super.token,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
      lang: json['lang'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'lang': lang,
      'token': token
    };
  }
}
