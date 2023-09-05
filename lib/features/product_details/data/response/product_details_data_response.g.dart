// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsDataResponse _$ProductDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsDataResponse(
      id: json['id'] as int?,
      productNameEn: json['productNameEn'] as String?,
      productNameAr: json['productNameAr'] as String?,
      brandEn: json['brandEn'] as String?,
      brandAr: json['brandAr'] as String?,
      productQty: json['productQty'] as int?,
      productSize: json['productSize'] as String?,
      basePrice: json['basePrice'] as int?,
      sellingPrice: json['sellingPrice'] as int?,
      discountPrice: json['discountPrice'] as int?,
      discount: json['discount'] as int?,
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      productThumbnail: json['productThumbnail'] as String?,
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      multiImg: (json['multiImg'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) =>
              ProductDetailsRatingsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      inFavorites: json['in_favorites'] as bool?,
      inCart: json['in_cart'] as bool?,
    );

Map<String, dynamic> _$ProductDetailsDataResponseToJson(
        ProductDetailsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productNameEn': instance.productNameEn,
      'productNameAr': instance.productNameAr,
      'brandEn': instance.brandEn,
      'brandAr': instance.brandAr,
      'productQty': instance.productQty,
      'productSize': instance.productSize,
      'basePrice': instance.basePrice,
      'sellingPrice': instance.sellingPrice,
      'discountPrice': instance.discountPrice,
      'discount': instance.discount,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'productThumbnail': instance.productThumbnail,
      'colors': instance.colors,
      'multiImg': instance.multiImg,
      'ratings': instance.ratings,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };
