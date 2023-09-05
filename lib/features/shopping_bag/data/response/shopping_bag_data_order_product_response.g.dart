// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_bag_data_order_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingBagDataOrderProductResponse
    _$ShoppingBagDataOrderProductResponseFromJson(Map<String, dynamic> json) =>
        ShoppingBagDataOrderProductResponse(
          id: json['id'] as int?,
          productColor: json['product_color'] as String?,
          productSize: json['product_size'] as int?,
          productPrice: json['product_price'] as int?,
          productName: json['product_name'] as String?,
          brand: json['brand'] as String?,
        );

Map<String, dynamic> _$ShoppingBagDataOrderProductResponseToJson(
        ShoppingBagDataOrderProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_color': instance.productColor,
      'product_size': instance.productSize,
      'product_price': instance.productPrice,
      'product_name': instance.productName,
      'brand': instance.brand,
    };
