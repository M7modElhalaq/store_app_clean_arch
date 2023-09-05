import 'package:store_app/features/shopping_bag/data/response/shopping_bag_response.dart';

import '../../../../core/network/app_api.dart';

abstract class RemoteShoppingBagDataSource {
  Future<ShoppingBagResponse> getShoppingBagData();
}

class RemoteShoppingBagDataSourceImpl extends RemoteShoppingBagDataSource {
  final AppService _appApi;

  RemoteShoppingBagDataSourceImpl(this._appApi);
  @override
  Future<ShoppingBagResponse> getShoppingBagData() async {
    return await _appApi.getShoppingBagData();
  }
}