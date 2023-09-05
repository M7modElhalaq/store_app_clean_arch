import 'package:store_app/features/home/data/mapper/categories_response_mapper.dart';
import 'package:store_app/features/home/data/mapper/home_data_products_response_mapper.dart';
import 'package:store_app/features/home/data/mapper/sliders_response_mapper.dart';

import '../../domain/model/home_data_model.dart';
import '../response/home_data_response.dart';

extension HomeDataProductsResponseMapper on HomeDataResponse {
  HomeDataModel toDomain() {
    return HomeDataModel(
      products: products!.toDomain(),
      sliders: sliders!.map((e) => e.toDomain()).toList(),
      categories: categories!.map((e) => e.toDomain()).toList(),
    );
  }
}