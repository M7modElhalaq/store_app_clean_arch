import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/model/products_model.dart';
import '../response/products_response.dart';

extension ProductsResponseMapper on ProductsResponse {
  ProductsModel toDomain() {
    return ProductsModel(
        id: id.onNull(),
        productName: productName.onNull(),
        brand: brand.onNull(),
        productQty: productQty.onNull(),
        sellingPrice: sellingPrice.onNull(),
        discountPrice: discountPrice.onNull(),
        productThumbnail: productThumbnail.onNull(),
        trend: trend.onNull(),
        newProduct: newProduct.onNull(),
        offer: offer.onNull(),
        inFavorites: inFavorites.onNull(),
        inCart: inCart.onNull(),
    );
  }
}