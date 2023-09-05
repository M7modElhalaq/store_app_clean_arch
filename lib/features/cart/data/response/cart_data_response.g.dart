// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDataResponse _$CartDataResponseFromJson(Map<String, dynamic> json) =>
    CartDataResponse(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      productColor: json['product_color'] as String?,
      productSize: json['product_size'] as int?,
      productQty: json['product_qty'] as int?,
      productName: json['product_name'] as String?,
      productThumbnail: json['product_thumbnail'] as String?,
    )..productPrice = json['product_price'] as int?;

Map<String, dynamic> _$CartDataResponseToJson(CartDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_color': instance.productColor,
      'product_size': instance.productSize,
      'product_qty': instance.productQty,
      'product_price': instance.productPrice,
      'product_name': instance.productName,
      'product_thumbnail': instance.productThumbnail,
    };
