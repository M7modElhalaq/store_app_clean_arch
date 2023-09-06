import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/model/login_data_model.dart';
import '../response/login_data_response.dart';

extension LoginDataResponseMapper on LoginDataResponse {
  LoginDataModel toDomain() {
    return LoginDataModel(
      id: id.onNull(),
      name: name.onNull(),
      email: email.onNull(),
      profileImage: profileImage.onNull(),
      phoneNumber: phoneNumber.onNull(),
      idNumber: idNumber.onNull(),
      dateOfBirth: dateOfBirth.onNull(),
      gender: gender.onNull(),
      address: address.onNull(),
    );
  }
}
