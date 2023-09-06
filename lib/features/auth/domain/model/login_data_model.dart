class LoginDataModel {
  int id;
  String name;
  String email;
  String profileImage;
  int phoneNumber;
  int idNumber;
  String dateOfBirth;
  String gender;
  String address;

  LoginDataModel(
      {required this.id,
        required this.name,
        required this.email,
        required this.profileImage,
        required this.phoneNumber,
        required this.idNumber,
        required this.dateOfBirth,
        required this.gender,
        required this.address});
}