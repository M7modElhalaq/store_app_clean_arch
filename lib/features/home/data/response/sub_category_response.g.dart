// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) =>
    SubCategoryResponse(
      id: json['id'] as int?,
      categoryId: json['category_id'] as int?,
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SubCategoryResponseToJson(
        SubCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
