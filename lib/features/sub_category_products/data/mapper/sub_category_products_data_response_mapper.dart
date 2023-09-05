
import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/model/sub_category_products_data_model.dart';
import '../response/sub_category_products_data_response.dart';

extension SubCategoryProductsDataResponseMapper on SubCategoryDataResponse {
  SubCategoryDataModel toDomain() {
    return SubCategoryDataModel(
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