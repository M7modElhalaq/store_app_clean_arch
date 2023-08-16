import 'package:dio/dio.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

import '../../../../core/constance.dart';

abstract class ProductRemoteDataSource{
  Future<List<ProductModel>> getProducts(String type);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final dio = Dio();
  @override
  Future<List<ProductModel>> getProducts(String type) async {
    final response = await dio.request(
      "${Constance.BASE_URL}/api/products/get_products/$type",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept-Language": "ar"
        },
        method: 'GET',
      ),
    );
    if (response.data['success'] == true) {
      List data = response.data['data']['data'];
      if(data.length != null) {
        return data.map((row) => ProductModel.fromJson(row)).toList();
      } else {
        throw NoProductException();
      }
    } else if (response.data['success'] == false) {
      throw NoProductException();
    } else {
      throw ServerException();
    }
  }
}