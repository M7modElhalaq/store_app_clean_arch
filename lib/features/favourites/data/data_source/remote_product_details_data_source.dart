import 'package:store_app/features/favourites/data/response/favorites_response.dart';

import '../../../../core/network/app_api.dart';

abstract class RemoteFavoritesDataSource {
  Future<FavoritesResponse> getFavoritesData();
}

class RemoteFavoritesDataSourceImpl implements RemoteFavoritesDataSource {
  final AppService _appService;

  RemoteFavoritesDataSourceImpl(this._appService);

  @override
  Future<FavoritesResponse> getFavoritesData() async {
    return await _appService.getFavoritesData();
  }

}