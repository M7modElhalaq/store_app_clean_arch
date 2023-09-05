import '../../../../core/network/app_api.dart';
import '../response/product_details_response.dart';

abstract class RemoteProductDetailsDataSource {
  Future<ProductDetailsResponse> productDetails(int id);
}

class RemoteProductDetailsDataSourceImpl implements RemoteProductDetailsDataSource {
  final AppService _appService;

  RemoteProductDetailsDataSourceImpl(this._appService);

  @override
  Future<ProductDetailsResponse> productDetails(int id) async {
    return await _appService.productDetails(id);
  }

}