// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataProductsResponse _$HomeDataProductsResponseFromJson(
        Map<String, dynamic> json) =>
    HomeDataProductsResponse(
      allProducts: (json['all_products'] as List<dynamic>?)
          ?.map((e) => ProductsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestProducts: (json['latest_products'] as List<dynamic>?)
          ?.map((e) => ProductsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      offerProducts: (json['offer_products'] as List<dynamic>?)
          ?.map((e) => ProductsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      topProducts: (json['top_products'] as List<dynamic>?)
          ?.map((e) => ProductsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataProductsResponseToJson(
        HomeDataProductsResponse instance) =>
    <String, dynamic>{
      'all_products': instance.allProducts,
      'latest_products': instance.latestProducts,
      'offer_products': instance.offerProducts,
      'top_products': instance.topProducts,
    };
