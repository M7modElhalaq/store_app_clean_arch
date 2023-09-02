import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';

class AppRemoteDataSource with Helpers {
  static final _instance = AppRemoteDataSource._internal();
  AppRemoteDataSource._internal();
  final Dio dio = Dio();
  AppSettingsSharedPreferences appSettingsSharedPreferences = AppSettingsSharedPreferences();
  // final userId = appSettingsSharedPreferences.userId;

  factory AppRemoteDataSource() {
    return _instance;
  }

  Future<bool> addOrRemoveFavorite(BuildContext context, {required int productId}) async {
    try {
      final response = await dio.request(ApiRequest.addOrDeleteFavorite,
        data: {
          "product_id": productId,
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            ApiConstants.contentTypeHeader: ApiConstants.contentType,
            ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
            ApiConstants.authorizationHeader : 'Bearer ${appSettingsSharedPreferences.defaultToken}'
          },
          method: 'POST',
        ),
      );
      var data = response.data['data'];
      if(response.statusCode == 200) {
        showSnackBar(context: context, message: response.data['message']);
        return data != null ? true : false;
      } else {
        showSnackBar(context: context, message: response.data['message'], error: true);
        return false;
      }
    } catch (e) {
      throw AddToFavFailure();
    }
  }

  Future<bool> addOrRemoveCart(BuildContext context, {required int productId}) async {
    try {
      final response = await dio.request(ApiRequest.addOrDeleteCart,
        data: {
          "product_id": productId,
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            ApiConstants.contentTypeHeader: ApiConstants.contentType,
            ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
            ApiConstants.authorizationHeader : 'Bearer ${appSettingsSharedPreferences.defaultToken}'
          },
          method: 'POST',
        ),
      );
      var data = response.data['data'];
      if(response.statusCode == 200) {
        showSnackBar(context: context, message: response.data['message']);
        return data != null ? true : false;
      } else {
        showSnackBar(context: context, message: response.data['message'], error: true);
        return false;
      }
    } catch (e) {
      throw AddToCartFailure();
    }
  }
}