import 'package:store_app/features/shopping_bag/data/mapper/shopping_bag_data_orders_response_mapper.dart';

import '../../domain/model/shopping_bag_data_model.dart';
import '../response/shopping_bag_data_response.dart';

extension ShoppingBagDataResponseMapper on ShoppingBagDataResponse {
  ShoppingBagDataModel toDomain() {
    return ShoppingBagDataModel(
      onProgress: onProgress!.map((e) => e.toDomain()).toList(),
      onDeliver: onDeliver!.map((e) => e.toDomain()).toList(),
      done: done!.map((e) => e.toDomain()).toList(),
      canceled: canceled!.map((e) => e.toDomain()).toList(),
    );
  }
}
