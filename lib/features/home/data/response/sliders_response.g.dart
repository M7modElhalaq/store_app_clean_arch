// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidersResponse _$SlidersResponseFromJson(Map<String, dynamic> json) =>
    SlidersResponse(
      id: json['id'] as int?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      textAr: json['text_ar'] as String?,
      textEn: json['text_en'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$SlidersResponseToJson(SlidersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'text_ar': instance.textAr,
      'text_en': instance.textEn,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
