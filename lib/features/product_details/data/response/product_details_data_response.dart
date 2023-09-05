import 'package:json_annotation/json_annotation.dart';

import 'product_details_ratings_response.dart';

part 'product_details_data_response.g.dart';

@JsonSerializable()
class ProductDetailsDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'product_name_en')
  String? productNameEn;
  @JsonKey(name: 'product_name_ar')
  String? productNameAr;
  @JsonKey(name: 'brand_en')
  String? brandEn;
  @JsonKey(name: 'brand_ar')
  String? brandAr;
  @JsonKey(name: 'product_qty')
  int? productQty;
  @JsonKey(name: 'product_size')
  String? productSize;
  @JsonKey(name: 'base_price')
  int? basePrice;
  @JsonKey(name: 'selling_price')
  int? sellingPrice;
  @JsonKey(name: 'discount_price')
  int? discountPrice;
  @JsonKey(name: 'discount')
  int? discount;
  @JsonKey(name: 'description_en')
  String? descriptionEn;
  @JsonKey(name: 'description_ar')
  String? descriptionAr;
  @JsonKey(name: 'product_thumbnail')
  String? productThumbnail;
  @JsonKey(name: 'colors')
  List<String>? colors;
  @JsonKey(name: 'multi_img')
  List<String>? multiImg;
  @JsonKey(name: 'ratings')
  List<ProductDetailsRatingsResponse>? ratings;
  @JsonKey(name: 'in_favorites')
  bool? inFavorites;
  @JsonKey(name: 'in_cart')
  bool? inCart;

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
        this.ratings,
        this.inFavorites,
        this.inCart,
      });

  factory ProductDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsDataResponseToJson(this);
}