import 'package:json_annotation/json_annotation.dart';

part 'product_details_ratings_response.g.dart';

@JsonSerializable()
class ProductDetailsRatingsResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'productId')
  int? productId;
  @JsonKey(name: 'customerId')
  int? customerId;
  @JsonKey(name: 'comments')
  String? comments;
  @JsonKey(name: 'starRating')
  int? starRating;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  ProductDetailsRatingsResponse(
      {this.id,
        this.productId,
        this.customerId,
        this.comments,
        this.starRating,
        this.createdAt,
        this.updatedAt});

  factory ProductDetailsRatingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsRatingsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsRatingsResponseToJson(this);
}