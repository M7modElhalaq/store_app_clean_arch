// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_bag_data_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingBagDataOrdersResponse _$ShoppingBagDataOrdersResponseFromJson(
        Map<String, dynamic> json) =>
    ShoppingBagDataOrdersResponse(
      id: json['id'] as int?,
      username: json['username'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ShoppingBagDataOrderProductResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShoppingBagDataOrdersResponseToJson(
        ShoppingBagDataOrdersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'address': instance.address,
      'phone': instance.phone,
      'products': instance.products,
    };
