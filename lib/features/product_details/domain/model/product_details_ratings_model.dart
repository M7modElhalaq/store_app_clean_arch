class ProductDetailsRatingsModel {
  int id;
  int productId;
  int customerId;
  String comments;
  int starRating;
  String createdAt;
  String updatedAt;

  ProductDetailsRatingsModel({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.comments,
    required this.starRating,
    required this.createdAt,
    required this.updatedAt,
  });
}
