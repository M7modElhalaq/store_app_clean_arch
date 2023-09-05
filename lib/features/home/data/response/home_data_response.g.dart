// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      products: json['products'] == null
          ? null
          : HomeDataProductsResponse.fromJson(
              json['products'] as Map<String, dynamic>),
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => SlidersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
      'sliders': instance.sliders,
      'categories': instance.categories,
    };
