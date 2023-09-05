
import 'package:json_annotation/json_annotation.dart';

import 'shopping_bag_data_order_product_response.dart';


part 'shopping_bag_data_orders_response.g.dart';

@JsonSerializable()
class ShoppingBagDataOrdersResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'phone')
  int? phone;
  @JsonKey(name: 'products')
  List<ShoppingBagDataOrderProductResponse>? products;

  ShoppingBagDataOrdersResponse({this.id, this.username, this.address, this.phone, this.products});

  factory ShoppingBagDataOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingBagDataOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShoppingBagDataOrdersResponseToJson(this);
}