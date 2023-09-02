import 'package:dio/dio.dart';
import 'package:store_app/core/base_response/home_response.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/network/app_api.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

import '../../../../core/constance.dart';

abstract class RemoteHomeDataSource{
  Future<HomeResponse> getHomeData();
}

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
  final AppService _appApi;
  final dio = Dio();

  RemoteHomeDataSourceImpl(this._appApi);

  AppSettingsSharedPreferences appSettingsSharedPreferences = AppSettingsSharedPreferences();

  @override
  Future<HomeResponse> getHomeData() async {
    return await _appApi.homeData();
  }
}