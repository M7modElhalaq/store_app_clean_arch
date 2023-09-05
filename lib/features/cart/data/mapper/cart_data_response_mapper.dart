import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/models/cart_data_model.dart';
import '../response/cart_data_response.dart';

extension CartDataResponseMapper on CartDataResponse {
  CartDataModel toDomain() {
    return CartDataModel(
      id: id.onNull(),
      productId: productId.onNull(),
      productColor: productColor.onNull(),
      productSize: productSize.onNull(),
      productQty: productQty.onQtyNull(),
      productName: productName.onNull(),
      productThumbnail: productThumbnail.onNull(),
      productPrice: productPrice.onNull(),
    );
  }
}
