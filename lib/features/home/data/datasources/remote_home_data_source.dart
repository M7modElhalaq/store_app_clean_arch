import 'package:store_app/features/home/data/response/home_response.dart';
import 'package:store_app/core/network/app_api.dart';

abstract class RemoteHomeDataSource{
  Future<HomeResponse> getHomeData();
}

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
  final AppService _appApi;

  RemoteHomeDataSourceImpl(this._appApi);

  @override
  Future<HomeResponse> getHomeData() async {
    return await _appApi.homeData();
  }
}