import 'package:store_app/features/auth/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.profileImage,
    required super.idNumber,
    required super.dateOfBirth,
    required super.gender,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'] ?? 0,
      profileImage: json['profile_image'] ?? '',
      idNumber: json['id_number'] ?? 0,
      dateOfBirth: json['date_of_birth'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'idNumber': idNumber,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }
}
