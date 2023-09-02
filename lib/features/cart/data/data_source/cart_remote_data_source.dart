import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse> getCartData();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final dio = Dio();
  AppSettingsSharedPreferences appSettingsSharedPreferences = AppSettingsSharedPreferences();

  @override
  Future<CartResponse> getCartData() async {
    final response = await dio.request(ApiRequest.apiCart,
      data: {
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
        headers: {
          ApiConstants.contentTypeHeader: ApiConstants.contentType,
          ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
          ApiConstants.authorizationHeader : 'Bearer ${appSettingsSharedPreferences.defaultToken}'
        },
        method: 'GET',
      ),
    );
    var data = response.data['data'] ?? [];
    if(response.statusCode == 200) {
      CartResponse categoryResponse = CartResponse.fromJson(response.data);
      return categoryResponse;
    } else if (response.data['success'] == false) {
      throw GetCartDataException();
    } else {
    throw ServerException();
    }
  }
}