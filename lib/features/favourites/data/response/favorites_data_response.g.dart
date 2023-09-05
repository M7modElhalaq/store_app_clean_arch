// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesDataResponse _$FavoritesDataResponseFromJson(
        Map<String, dynamic> json) =>
    FavoritesDataResponse(
      id: json['id'] as int?,
      productName: json['product_name'] as String?,
      brand: json['brand'] as String?,
      productQty: json['product_qty'] as int?,
      sellingPrice: json['selling_price'] as int?,
      discountPrice: json['discount_price'] as int?,
      productThumbnail: json['product_thumbnail'] as String?,
      trend: json['trend'] as int?,
      newProduct: json['new_product'] as int?,
      offer: json['offer'] as int?,
      inFavorites: json['in_favorites'] as bool?,
      inCart: json['in_cart'] as bool?,
    );

Map<String, dynamic> _$FavoritesDataResponseToJson(
        FavoritesDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'brand': instance.brand,
      'product_qty': instance.productQty,
      'selling_price': instance.sellingPrice,
      'discount_price': instance.discountPrice,
      'product_thumbnail': instance.productThumbnail,
      'trend': instance.trend,
      'new_product': instance.newProduct,
      'offer': instance.offer,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };
