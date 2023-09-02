import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/cart/data/models/cart_response.dart';
import 'package:store_app/features/cart/domain/entities/cart_model.dart';

extension CartMapper on CartResponse {
  CartModel toDomain() {
    return CartModel(
      success: success.onNull(),
      message: message.onNull(),
      data: data!.map((e) => e.toDomain()).toList(),
    );
  }
}

extension CartDataMapper on DataResponse {
  Data toDomain() {
    return Data(
      id: id.onNull(),
      customerId: customerId.onNull(),
      productId: productId.onNull(),
      productColor: productColor.onNull(),
      productSize: productSize.onNull(),
      productQty: productQty.onNull(),
      product: product!.toDomain()
    );
  }
}

extension CartDataProductMapper on CartResponseProduct {
  Product toDomain() {
    return Product(
      id: id.onNull(),
      categoryId: categoryId.onNull(),
      subcategoryId: subcategoryId.onNull(),
      productName: productName.onNull(),
      brand: brand.onNull(),
      productQty: productQty.onNull(),
      productSize: productSize.onNull(),
      basePrice: basePrice.onNull(),
      sellingPrice: sellingPrice.onNull(),
      discountPrice: discountPrice.onNull(),
      descriptionEn: descriptionEn.onNull(),
      productThumbnail: productThumbnail.onNull(),
      trend: trend.onNull(),
      newProduct: newProduct.onNull(),
      offer: offer.onNull(),
      colors: colors.onNull(),
      images: images.onNull(),
      ratings: ratings!.map((e) => e.toDomain()).toList(),
      inFavorites: inFavorites.onNull(),
      inCart: inCart.onNull(),
    );
  }
}

extension CartDataProductRatingsMapper on CartResponseProductRatings {
  Ratings toDomain() {
    return Ratings(
      id: id.onNull(),
      productId: productId.onNull(),
      customerId: customerId.onNull(),
      comments: comments.onNull(),
      starRating: starRating.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull()
    );
  }
}