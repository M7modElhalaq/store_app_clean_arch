
import 'package:json_annotation/json_annotation.dart';

part 'cart_data_response.g.dart';

@JsonSerializable()
class CartDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'product_color')
  String? productColor;
  @JsonKey(name: 'product_size')
  int? productSize;
  @JsonKey(name: 'product_qty')
  int? productQty;
  @JsonKey(name: 'product_price')
  int? productPrice;
  @JsonKey(name: 'product_name')
  String? productName;
  @JsonKey(name: 'product_thumbnail')
  String? productThumbnail;

  CartDataResponse(
      {this.id,
        this.productId,
        this.productColor,
        this.productSize,
        this.productQty,
        this.productName,
        this.productThumbnail});

  factory CartDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CartDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CartDataResponseToJson(this);
}