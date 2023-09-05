import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/model/product_details_ratings_model.dart';
import '../response/product_details_ratings_response.dart';

extension ProductDetailsRatingsMapper on ProductDetailsRatingsResponse {
  ProductDetailsRatingsModel toDomain() {
    return ProductDetailsRatingsModel(
      id: id.onNull(),
      productId: productId.onNull(),
      customerId: customerId.onNull(),
      comments: comments.onNull(),
      starRating: starRating.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
    );
  }
}
