class ProductsModel {
  int id;
  String productName;
  String brand;
  String productQty;
  int sellingPrice;
  int discountPrice;
  String productThumbnail;
  int trend;
  int newProduct;
  int offer;
  bool inFavorites;
  bool inCart;

  ProductsModel(
      {required this.id,
        required this.productName,
        required this.brand,
        required this.productQty,
        required this.sellingPrice,
        required this.discountPrice,
        required this.productThumbnail,
        required this.trend,
        required this.newProduct,
        required this.offer,
        required this.inFavorites,
        required this.inCart});
}