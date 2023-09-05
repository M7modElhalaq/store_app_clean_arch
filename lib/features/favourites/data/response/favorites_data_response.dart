import 'package:json_annotation/json_annotation.dart';

part 'favorites_data_response.g.dart';

@JsonSerializable()
class FavoritesDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'product_name')
  String? productName;
  @JsonKey(name: 'brand')
  String? brand;
  @JsonKey(name: 'product_qty')
  int? productQty;
  @JsonKey(name: 'selling_price')
  int? sellingPrice;
  @JsonKey(name: 'discount_price')
  int? discountPrice;
  @JsonKey(name: 'product_thumbnail')
  String? productThumbnail;
  @JsonKey(name: 'trend')
  int? trend;
  @JsonKey(name: 'new_product')
  int? newProduct;
  @JsonKey(name: 'offer')
  int? offer;
  @JsonKey(name: 'in_favorites')
  bool? inFavorites;
  @JsonKey(name: 'in_cart')
  bool? inCart;

  FavoritesDataResponse(
      {this.id,
        this.productName,
        this.brand,
        this.productQty,
        this.sellingPrice,
        this.discountPrice,
        this.productThumbnail,
        this.trend,
        this.newProduct,
        this.offer,
        this.inFavorites,
        this.inCart});

  factory FavoritesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FavoritesDataResponseToJson(this);
}