
import 'package:json_annotation/json_annotation.dart';

import 'shopping_bag_data_orders_response.dart';

part 'shopping_bag_data_response.g.dart';

@JsonSerializable()
class ShoppingBagDataResponse {
  @JsonKey(name: 'on_progress')
  List<ShoppingBagDataOrdersResponse>? onProgress;
  @JsonKey(name: 'on_deliver')
  List<ShoppingBagDataOrdersResponse>? onDeliver;
  @JsonKey(name: 'done')
  List<ShoppingBagDataOrdersResponse>? done;
  @JsonKey(name: 'canceled')
  List<ShoppingBagDataOrdersResponse>? canceled;

  ShoppingBagDataResponse({this.onProgress, this.onDeliver, this.done, this.canceled});

  factory ShoppingBagDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingBagDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShoppingBagDataResponseToJson(this);
}