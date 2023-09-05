import 'product_details_ratings_model.dart';

class ProductDetailsDataModel {
  int id;
  String productNameEn;
  String productNameAr;
  String brandEn;
  String brandAr;
  int productQty;
  String productSize;
  int basePrice;
  int sellingPrice;
  int discountPrice;
  int discount;
  String descriptionEn;
  String descriptionAr;
  String productThumbnail;
  List<String> colors;
  List<String> multiImg;
  List<ProductDetailsRatingsModel> ratings;
  bool inFavorites;
  bool inCart;

  ProductDetailsDataModel(
      {required this.id,
        required this.productNameEn,
        required this.productNameAr,
        required this.brandEn,
        required this.brandAr,
        required this.productQty,
        required this.productSize,
        required this.basePrice,
        required this.sellingPrice,
        required this.discountPrice,
        required this.discount,
        required this.descriptionEn,
        required this.descriptionAr,
        required this.productThumbnail,
        required this.colors,
        required this.multiImg,
        required this.ratings,
        required this.inFavorites,
        required this.inCart,
      });
}