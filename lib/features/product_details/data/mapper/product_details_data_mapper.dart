import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/product_details/data/mapper/product_details_ratings_mapper.dart';

import '../../domain/model/product_details_data_model.dart';
import '../response/product_details_data_response.dart';

extension ProductDetailsDataMapper on ProductDetailsDataResponse {
  ProductDetailsDataModel toDomain() {
    return ProductDetailsDataModel(
      id: id.onNull(),
      productNameEn: productNameEn.onNull(),
      productNameAr: productNameAr.onNull(),
      brandEn: brandEn.onNull(),
      brandAr: brandAr.onNull(),
      productQty: productQty.onNull(),
      productSize: productSize.onNull(),
      basePrice: basePrice.onNull(),
      sellingPrice: sellingPrice.onNull(),
      discountPrice: discountPrice.onNull(),
      discount: discount.onNull(),
      descriptionEn: descriptionEn.onNull(),
      descriptionAr: descriptionAr.onNull(),
      productThumbnail: productThumbnail.onNull(),
      colors: colors.onNull(),
      multiImg: multiImg.onNull(),
      ratings: ratings!.map((e) => e.toDomain()).toList(),
      inFavorites: inFavorites.onNull(),
      inCart: inCart.onNull(),
    );
  }
}
