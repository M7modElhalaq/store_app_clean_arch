import 'package:json_annotation/json_annotation.dart';
import 'package:store_app/features/home/data/response/products_response.dart';

part 'home_data_products_response.g.dart';

@JsonSerializable()
class HomeDataProductsResponse {
  @JsonKey(name: 'all_products')
  List<ProductsResponse>? allProducts;
  @JsonKey(name: 'latest_products')
  List<ProductsResponse>? latestProducts;
  @JsonKey(name: 'offer_products')
  List<ProductsResponse>? offerProducts;
  @JsonKey(name: 'top_products')
  List<ProductsResponse>? topProducts;

  HomeDataProductsResponse(
      {this.allProducts,
        this.latestProducts,
        this.offerProducts,
        this.topProducts});

  factory HomeDataProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataProductsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeDataProductsResponseToJson(this);
}