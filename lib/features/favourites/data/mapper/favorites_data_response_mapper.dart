import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/model/favorites_data_model.dart';
import '../response/favorites_data_response.dart';

extension FavoritesDataResponseMapper on FavoritesDataResponse {
  FavoritesDataModel toDomain() {
    return FavoritesDataModel(
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
