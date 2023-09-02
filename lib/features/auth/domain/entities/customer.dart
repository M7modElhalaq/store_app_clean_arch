import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int id;
  final String name;
  final String email;
  final int phoneNumber;
  final String profileImage;
  final int idNumber;
  final String dateOfBirth;
  final String gender;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.idNumber,
    required this.profileImage,
    required this.dateOfBirth,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        profileImage,
        idNumber,
        dateOfBirth,
        gender,
      ];
}