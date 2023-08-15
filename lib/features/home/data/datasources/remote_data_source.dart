import 'package:dio/dio.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

import '../../../../core/constance.dart';

abstract class RemoteDataSource{
  Future<List<ProductModel>> getProducts(String type);
}

class RemoteDataSourceImpl implements RemoteDataSource {
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
        method: 'POST',
      ),
    );
    if (response.data['success'] == true) {
      final List<ProductModel> listProductModel = response.data['data'].map((row) => ProductModel.fromJson(row)).toList();
      return listProductModel;
    } else if (response.data['success'] == false) {
      throw NoProductException();
    } else {
      throw ServerException();
    }
  }
}