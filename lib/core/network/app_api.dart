import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store_app/core/base_response/home_response.dart';
import 'package:store_app/core/constance.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constance.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  // @GET(RequestsConstants.images)
  // Future<ImagesResponse> homeData();

  @GET(ApiRequest.apiGetHome)
  Future<HomeResponse> homeData();
}
