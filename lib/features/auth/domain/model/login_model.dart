
import 'login_data_model.dart';

class LoginModel {
  bool success;
  String message;
  String token;
  LoginDataModel data;

  LoginModel({required this.success, required this.message, required this.token, required this.data});
}