// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsDataResponse _$ProductDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsDataResponse(
      id: json['id'] as int?,
      productNameEn: json['product_name_en'] as String?,
      productNameAr: json['product_name_ar'] as String?,
      brandEn: json['brand_en'] as String?,
      brandAr: json['brand_ar'] as String?,
      productQty: json['product_qty'] as int?,
      productSize: json['product_size'] as String?,
      basePrice: json['base_price'] as int?,
      sellingPrice: json['selling_price'] as int?,
      discountPrice: json['discount_price'] as int?,
      discount: json['discount'] as int?,
      descriptionEn: json['description_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      productThumbnail: json['product_thumbnail'] as String?,
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      multiImg: (json['multi_img'] as List<dynamic>?)
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
      'product_name_en': instance.productNameEn,
      'product_name_ar': instance.productNameAr,
      'brand_en': instance.brandEn,
      'brand_ar': instance.brandAr,
      'product_qty': instance.productQty,
      'product_size': instance.productSize,
      'base_price': instance.basePrice,
      'selling_price': instance.sellingPrice,
      'discount_price': instance.discountPrice,
      'discount': instance.discount,
      'description_en': instance.descriptionEn,
      'description_ar': instance.descriptionAr,
      'product_thumbnail': instance.productThumbnail,
      'colors': instance.colors,
      'multi_img': instance.multiImg,
      'ratings': instance.ratings,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };
