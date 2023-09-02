import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:store_app/config/dependancy_injection.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppSettingsSharedPreferences _appPreferences = sl<AppSettingsSharedPreferences>();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      ApiConstants.authorizationHeader: getAuthorization(_appPreferences.defaultToken),
      ApiConstants.acceptLanguage: _appPreferences.defaultLocale,
      ApiConstants.acceptHeader: ApiConstants.accept,
      ApiConstants.contentTypeHeader: ApiConstants.contentType,
    };

    dio.options = BaseOptions(
      baseUrl: Constance.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(
        seconds: Constance.sendTimeOutDuration,
      ),
      sendTimeout: const Duration(
        seconds: Constance.receiveTimeOutDuration,
      ),
    );

    InterceptorsWrapper authInterceptor = InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers[ApiConstants.authorizationHeader] = getAuthorization(
          _appPreferences.defaultToken,
        );
        return handler.next(options);
      },
    );
    dio.interceptors.add(authInterceptor);

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          requestHeader: true,
        ),
      );
    }
    return dio;
  }

  String getAuthorization(String token) {
    return '${Constance.bearer} $token';
  }
}
