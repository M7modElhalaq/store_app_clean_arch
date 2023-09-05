
import 'package:json_annotation/json_annotation.dart';

part 'shopping_bag_data_order_product_response.g.dart';

@JsonSerializable()
class ShoppingBagDataOrderProductResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'product_color')
  String? productColor;
  @JsonKey(name: 'product_size')
  int? productSize;
  @JsonKey(name: 'product_price')
  int? productPrice;
  @JsonKey(name: 'product_name')
  String? productName;
  @JsonKey(name: 'brand')
  String? brand;

  ShoppingBagDataOrderProductResponse(
      {this.id,
        this.productColor,
        this.productSize,
        this.productPrice,
        this.productName,
        this.brand});

  factory ShoppingBagDataOrderProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ShoppingBagDataOrderProductResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShoppingBagDataOrderProductResponseToJson(this);
}