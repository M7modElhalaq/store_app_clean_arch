import '../../../../core/network/app_api.dart';
import '../response/cart_response.dart';

abstract class RemoteCartGetDataSource {
  Future<CartResponse> getCartData();
}

class RemoteCartGetDataSourceImpl implements RemoteCartGetDataSource {
  final AppService _appService;

  RemoteCartGetDataSourceImpl(this._appService);

  @override
  Future<CartResponse> getCartData() async {
    return await _appService.getCartData();
  }

}