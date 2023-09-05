import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/model/shopping_bag_data_order_product_model.dart';
import '../response/shopping_bag_data_order_product_response.dart';

extension ShoppingBagDataOrderProductResponseMapper on ShoppingBagDataOrderProductResponse {
  ShoppingBagDataOrderProductModel toDomain() {
    return ShoppingBagDataOrderProductModel(
      id: id.onNull(),
      productColor: productColor.onNull(),
      productSize: productSize.onNull(),
      productPrice: productPrice.onNull(),
      productName: productName.onNull(),
      brand: brand.onNull(),
    );
  }
}