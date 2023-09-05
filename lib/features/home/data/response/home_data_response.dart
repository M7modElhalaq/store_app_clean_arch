import 'package:json_annotation/json_annotation.dart';
import 'package:store_app/features/home/data/response/sliders_response.dart';

import 'categories_response.dart';
import 'home_data_products_response.dart';

part 'home_data_response.g.dart';

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: 'products')
  HomeDataProductsResponse? products;
  @JsonKey(name: 'sliders')
  List<SlidersResponse>? sliders;
  @JsonKey(name: 'categories')
  List<CategoriesResponse>? categories;

  HomeDataResponse({this.products, this.sliders, this.categories});

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeDataResponseToJson(this);
}