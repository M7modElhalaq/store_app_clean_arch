class CartDataModel {
  int id;
  int productId;
  String productColor;
  int productSize;
  int productQty;
  int productPrice;
  String productName;
  String productThumbnail;

  CartDataModel(
      {required this.id,
        required this.productId,
        required this.productColor,
        required this.productSize,
        required this.productQty,
        required this.productPrice,
        required this.productName,
        required this.productThumbnail});
}