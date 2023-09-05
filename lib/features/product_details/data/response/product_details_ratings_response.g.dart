// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_ratings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsRatingsResponse _$ProductDetailsRatingsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsRatingsResponse(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      customerId: json['customerId'] as int?,
      comments: json['comments'] as String?,
      starRating: json['starRating'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProductDetailsRatingsResponseToJson(
        ProductDetailsRatingsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'customerId': instance.customerId,
      'comments': instance.comments,
      'starRating': instance.starRating,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
