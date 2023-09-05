import 'package:json_annotation/json_annotation.dart';

import 'product_details_ratings_response.dart';

part 'product_details_data_response.g.dart';

@JsonSerializable()
class ProductDetailsDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'productNameEn')
  String? productNameEn;
  @JsonKey(name: 'productNameAr')
  String? productNameAr;
  @JsonKey(name: 'brandEn')
  String? brandEn;
  @JsonKey(name: 'brandAr')
  String? brandAr;
  @JsonKey(name: 'productQty')
  String? productQty;
  @JsonKey(name: 'productSize')
  String? productSize;
  @JsonKey(name: 'basePrice')
  int? basePrice;
  @JsonKey(name: 'sellingPrice')
  int? sellingPrice;
  @JsonKey(name: 'discountPrice')
  int? discountPrice;
  @JsonKey(name: 'discount')
  int? discount;
  @JsonKey(name: 'descriptionEn')
  String? descriptionEn;
  @JsonKey(name: 'descriptionAr')
  String? descriptionAr;
  @JsonKey(name: 'productThumbnail')
  String? productThumbnail;
  @JsonKey(name: 'colors')
  List<String>? colors;
  @JsonKey(name: 'multiImg')
  List<String>? multiImg;
  @JsonKey(name: 'ratings')
  List<ProductDetailsRatingsResponse>? ratings;

  ProductDetailsDataResponse(
      {this.id,
        this.productNameEn,
        this.productNameAr,
        this.brandEn,
        this.brandAr,
        this.productQty,
        this.productSize,
        this.basePrice,
        this.sellingPrice,
        this.discountPrice,
        this.discount,
        this.descriptionEn,
        this.descriptionAr,
        this.productThumbnail,
        this.colors,
        this.multiImg,
        this.ratings});

  factory ProductDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsDataResponseToJson(this);
}