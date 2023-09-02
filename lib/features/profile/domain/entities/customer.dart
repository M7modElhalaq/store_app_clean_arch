import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String name;
  final String email;
  final int phoneNumber;
  final String profileImage;
  final int idNumber;
  final String dateOfBirth;
  final String gender;
  final String lang;
  final String token;

  Customer({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.idNumber,
    required this.profileImage,
    required this.dateOfBirth,
    required this.gender,
    required this.lang,
    required this.token,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        profileImage,
        idNumber,
        dateOfBirth,
        gender,
        lang,
        token,
      ];
}

/*
*
* {
    "name": "Mhmod Elhalaq",
    "email": "mahmoudvee23@gmail.com",
    "phone_number": 972599187654,
    "id_number": 402850441,
    "profile_image": null,
    "date_of_birth": "1997-05-23",
    "gender": "male",
    "token": "",
    "lang": "ar"
}
*
*
* */
