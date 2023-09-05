// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) =>
    SubCategoryResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      subCategoryName: json['sub_category_name'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SubCategoryDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCategoryResponseToJson(
        SubCategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'sub_category_name': instance.subCategoryName,
      'data': instance.data,
    };
