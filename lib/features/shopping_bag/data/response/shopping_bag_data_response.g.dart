// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_bag_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingBagDataResponse _$ShoppingBagDataResponseFromJson(
        Map<String, dynamic> json) =>
    ShoppingBagDataResponse(
      onProgress: (json['on_progress'] as List<dynamic>?)
          ?.map((e) =>
              ShoppingBagDataOrdersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      onDeliver: (json['on_deliver'] as List<dynamic>?)
          ?.map((e) =>
              ShoppingBagDataOrdersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      done: (json['done'] as List<dynamic>?)
          ?.map((e) =>
              ShoppingBagDataOrdersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      canceled: (json['canceled'] as List<dynamic>?)
          ?.map((e) =>
              ShoppingBagDataOrdersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShoppingBagDataResponseToJson(
        ShoppingBagDataResponse instance) =>
    <String, dynamic>{
      'on_progress': instance.onProgress,
      'on_deliver': instance.onDeliver,
      'done': instance.done,
      'canceled': instance.canceled,
    };
