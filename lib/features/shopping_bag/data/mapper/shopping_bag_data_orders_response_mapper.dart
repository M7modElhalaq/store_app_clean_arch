import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/shopping_bag/data/mapper/shopping_bag_data_order_product_response_mapper.dart';

import '../../domain/model/shopping_bag_data_orders_model.dart';
import '../response/shopping_bag_data_orders_response.dart';

extension ShoppingBagDataOrdersResponseMapper on ShoppingBagDataOrdersResponse {
  ShoppingBagDataOrdersModel toDomain() {
    return ShoppingBagDataOrdersModel(
      id: id.onNull(),
      username: username.onNull(),
      address: address.onNull(),
      phone: phone.onNull(),
      products: products!.map((e) => e.toDomain()).toList(),
    );
  }
}
