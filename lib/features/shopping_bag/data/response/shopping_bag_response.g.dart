// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_bag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingBagResponse _$ShoppingBagResponseFromJson(Map<String, dynamic> json) =>
    ShoppingBagResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ShoppingBagDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShoppingBagResponseToJson(
        ShoppingBagResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
