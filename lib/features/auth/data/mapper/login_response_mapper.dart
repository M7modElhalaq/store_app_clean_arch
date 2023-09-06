import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/auth/data/mapper/login_data_response_mapper.dart';
import 'package:store_app/features/auth/data/response/login_response.dart';
import 'package:store_app/features/auth/domain/model/login_model.dart';

extension LoginResponseMapper on LoginResponse {
  LoginModel toDomain() {
    return LoginModel(
      success: success.onNull(),
      message: message.onNull(),
      token: token.onNull(),
      data: data!.toDomain(),
    );
  }
}
