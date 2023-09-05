
import '../../../../core/network/app_api.dart';
import '../response/sub_category_products_response.dart';

abstract class RemoteGetSubProductsDataDataSource {
  Future<SubCategoryResponse> getSubCategoryProducts(int id);
}

class RemoteGetSubProductsDataDataSourceImpl implements RemoteGetSubProductsDataDataSource {
  final AppService _appService;

  RemoteGetSubProductsDataDataSourceImpl(this._appService);

  @override
  Future<SubCategoryResponse> getSubCategoryProducts(int id) async {
    return await _appService.getSubCategoryProducts(id);
  }

}