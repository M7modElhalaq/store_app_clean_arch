import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/features/profile/data/models/customer_model.dart';


abstract class ProfileRemoteDataSource {
  Future<CustomerModel> getCustomerData(int phoneNumber);

  Future<bool> updateProfile(CustomerModel customer, File image);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final dio = Dio();
  FirebaseAuth auth = FirebaseAuth.instance;
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();

  @override
  Future<CustomerModel> getCustomerData(int phoneNumber) async {
    final response = await dio.request(ApiRequest.apiAuthGetData,
      options: Options(
        headers: {
          ApiConstants.contentTypeHeader: ApiConstants.contentType,
          ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
          ApiConstants.authorizationHeader: 'Bearer ${appSettingsSharedPreferences.defaultToken}'
        },
        method: 'GET',
      ),
    );
    if (response.statusCode == 200) {
      final CustomerModel customerModel =
          CustomerModel.fromJson(response.data['data']);
      return customerModel;
    } else {
      throw UserNotFoundException();
    }
  }

  @override
  Future<bool> updateProfile(
      CustomerModel customer, File image) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${Constance.baseUrl}/api/customers/update"));
      request.fields['name'] = customer.name;
      request.fields['email'] = customer.email;
      request.fields['phone_number'] = customer.phoneNumber.toString();
      request.fields['id_number'] = customer.idNumber.toString();
      request.fields['date_of_birth'] = customer.dateOfBirth;
      request.fields['gender'] = customer.gender;

      request.files.add(http.MultipartFile.fromBytes(
          'profile_image', File(image.path).readAsBytesSync(),
          filename: image.path));

      var response = await request.send();
      var resData;

      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          resData = jsonDecode(value)['data'];
        });
        return true;
      } else {
        throw UpdateProfileException();
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
