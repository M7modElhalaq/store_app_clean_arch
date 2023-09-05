import 'package:store_app/features/home/data/mapper/products_mapper.dart';
import 'package:store_app/features/home/data/response/home_data_products_response.dart';

import '../../domain/model/home_data_products_model.dart';

extension HomeDataProductsResponseMapper on HomeDataProductsResponse {
  HomeDataProductsModel toDomain() {
    return HomeDataProductsModel(
      allProducts: allProducts!.map((e) => e.toDomain()).toList(),
      latestProducts: latestProducts!.map((e) => e.toDomain()).toList(),
      offerProducts: offerProducts!.map((e) => e.toDomain()).toList(),
      topProducts: topProducts!.map((e) => e.toDomain()).toList(),
    );
  }
}