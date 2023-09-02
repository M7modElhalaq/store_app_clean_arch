class HomeModel {
  bool status;
  String message;
  HomeData data;

  HomeModel({required this.status, required this.message, required this.data});
}

class HomeData {
  HomeDataProducts products;
  List<Sliders> sliders;
  List<Categories> categories;

  HomeData({required this.products, required this.sliders, required this.categories});
}

class HomeDataProducts {
  List<Products> allProducts;
  List<Products> latestProducts;
  List<Products> offerProducts;
  List<Products> topProducts;

  HomeDataProducts(
      {required this.allProducts,
        required this.latestProducts,
        required this.offerProducts,
        required this.topProducts});
}

class Products {
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
  List<String> images;
  List<Ratings> ratings;
  bool inFavorites;
  bool inCart;

  Products(
      {required this.id,
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
        required this.inCart});
}

class Ratings {
  int id;
  int productId;
  int customerId;
  String comments;
  int starRating;
  String createdAt;
  String updatedAt;

  Ratings(
      {required this.id,
        required this.productId,
        required this.customerId,
        required this.comments,
        required this.starRating,
        required this.createdAt,
        required this.updatedAt});
}

class Sliders {
  int id;
  String titleAr;
  String titleEn;
  String textAr;
  String textEn;
  String image;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Sliders(
      {required this.id,
        required this.titleAr,
        required this.titleEn,
        required this.textAr,
        required this.textEn,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});
}

class Categories {
  int id;
  String nameEn;
  String nameAr;
  String createdAt;
  String updatedAt;
  List<SubCategory> subCategory;

  Categories(
      {required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.createdAt,
        required this.updatedAt,
        required this.subCategory});
}

class SubCategory {
  int id;
  int categoryId;
  String nameEn;
  String nameAr;
  String createdAt;
  String updatedAt;

  SubCategory(
      {required this.id,
        required this.categoryId,
        required this.nameEn,
        required this.nameAr,
        required this.createdAt,
        required this.updatedAt});
}