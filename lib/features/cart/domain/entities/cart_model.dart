class CartModel {
  bool success;
  String message;
  List<Data> data;

  CartModel({required this.success, required this.message, required this.data});
}

class Data {
  int id;
  int customerId;
  int productId;
  String productColor;
  int productSize;
  int productQty;
  Product? product;

  Data({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.productColor,
    required this.productSize,
    required this.productQty,
    required this.product,
  });
}

class Product {
  int id;
  int categoryId;
  int subcategoryId;
  String productName;
  String brand;
  String productQty;
  String productSize;
  int basePrice;
  int sellingPrice;
  int discountPrice;
  String descriptionEn;
  String productThumbnail;
  int trend;
  int newProduct;
  int offer;
  List<String> colors;
  List<int> images;
  List<Ratings> ratings;
  bool inFavorites;
  bool inCart;

  Product({
    required this.id,
    required this.categoryId,
    required this.subcategoryId,
    required this.productName,
    required this.brand,
    required this.productQty,
    required this.productSize,
    required this.basePrice,
    required this.sellingPrice,
    required this.discountPrice,
    required this.descriptionEn,
    required this.productThumbnail,
    required this.trend,
    required this.newProduct,
    required this.offer,
    required this.colors,
    required this.images,
    required this.ratings,
    required this.inFavorites,
    required this.inCart,
  });
}

class Ratings {
  int id;
  int productId;
  int customerId;
  String comments;
  int starRating;
  String createdAt;
  String updatedAt;

  Ratings({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.comments,
    required this.starRating,
    required this.createdAt,
    required this.updatedAt,
  });
}
