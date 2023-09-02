import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../models/customer_model.dart';

abstract class RemoteDataSource {
  Future<CustomerModel> login(int phoneNumber);
  Future<String> sendSmsVerifyCode(int phoneNumber);
  Future<String> verifyPhone(int phoneNumber);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final dio = Dio();
  FirebaseAuth auth = FirebaseAuth.instance;
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();
  @override
  Future<CustomerModel> login(int phoneNumber) async {
    final response = await dio.request(ApiRequest.apiAuthLogin,
      data: {
        ApiConstants.phoneNumber: phoneNumber
      },
      options: Options(
        headers: {
          ApiConstants.contentTypeHeader: ApiConstants.contentType,
          ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale
        },
        method: 'POST',
        validateStatus: (status) => true,
      ),
    );
    print(response);
    if (response.data['success'] == true) {
      final CustomerModel customerModel = CustomerModel.fromJson(response.data['data']);
      print('Login Remote');
      print(customerModel);
      print(ApiConstants.token);
      appSettingsSharedPreferences.saveUserInfo(customerModel);
      appSettingsSharedPreferences.setToken(response.data[ApiConstants.token]);
      return customerModel;
    } else if (response.data['success'] == false) {
      throw NotRegisteredException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> sendSmsVerifyCode(int phoneNumber) async {
    print('From Login Remote Phone Nnumber: $phoneNumber');
    String? verifyId;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verifyId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      print('verificationId: $verifyId');
      return verifyId!;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> verifyPhone(int phoneNumber) async {
    String? verifyId;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          verifyId = verificationId;
          String smsCode = '123456';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential).then((value) => print('Verify Success'));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      print('verificationId: $verifyId');
      return verifyId!;
    } catch (e) {
      return e.toString();
    }
  }
}