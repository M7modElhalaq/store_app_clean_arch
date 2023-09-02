import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  bool? status;
  String? message;
  HomeDataResponse? data;

  HomeResponse({this.status, this.message, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeDataResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class HomeDataResponse {
  HomeDataProductsResponse? products;
  List<HomeDataSlidersResponse>? sliders;
  List<HomeDataCategoriesResponse>? categories;

  HomeDataResponse({this.products, this.sliders, this.categories});

  HomeDataResponse.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? HomeDataProductsResponse.fromJson(json['products'])
        : null;
    if (json['sliders'] != null) {
      sliders = <HomeDataSlidersResponse>[];
      json['sliders'].forEach((v) {
        sliders!.add(HomeDataSlidersResponse.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <HomeDataCategoriesResponse>[];
      json['categories'].forEach((v) {
        categories!.add(HomeDataCategoriesResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.toJson();
    }
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeDataProductsResponse {
  List<ProductsResponse>? allProducts;
  List<ProductsResponse>? latestProducts;
  List<ProductsResponse>? offerProducts;
  List<ProductsResponse>? topProducts;

  HomeDataProductsResponse(
      {this.allProducts,
        this.latestProducts,
        this.offerProducts,
        this.topProducts});

  HomeDataProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['all_products'] != null) {
      allProducts = <ProductsResponse>[];
      json['all_products'].forEach((v) {
        allProducts!.add(ProductsResponse.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <ProductsResponse>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(ProductsResponse.fromJson(v));
      });
    }
    if (json['offer_products'] != null) {
      offerProducts = <ProductsResponse>[];
      json['offer_products'].forEach((v) {
        offerProducts!.add(ProductsResponse.fromJson(v));
      });
    }
    if (json['top_products'] != null) {
      topProducts = <ProductsResponse>[];
      json['top_products'].forEach((v) {
        topProducts!.add(ProductsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allProducts != null) {
      data['all_products'] = allProducts!.map((v) => v.toJson()).toList();
    }
    if (latestProducts != null) {
      data['latest_products'] =
          latestProducts!.map((v) => v.toJson()).toList();
    }
    if (offerProducts != null) {
      data['offer_products'] =
          offerProducts!.map((v) => v.toJson()).toList();
    }
    if (topProducts != null) {
      data['top_products'] = topProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsResponse {
  int? id;
  int? categoryId;
  int? subcategoryId;
  String? productName;
  String? brand;
  String? productQty;
  String? productSize;
  int? basePrice;
  int? sellingPrice;
  int? discountPrice;
  String? descriptionEn;
  String? productThumbnail;
  int? trend;
  int? newProduct;
  int? offer;
  List<String>? colors;
  List<String>? images;
  List<HomeDataRatingsResponse>? ratings;
  bool? inFavorites;
  bool? inCart;

  ProductsResponse(
      {this.id,
        this.categoryId,
        this.subcategoryId,
        this.productName,
        this.brand,
        this.productQty,
        this.productSize,
        this.basePrice,
        this.sellingPrice,
        this.discountPrice,
        this.descriptionEn,
        this.productThumbnail,
        this.trend,
        this.newProduct,
        this.offer,
        this.colors,
        this.images,
        this.ratings,
        this.inFavorites,
        this.inCart});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    productName = json['product_name'];
    brand = json['brand'];
    productQty = json['product_qty'];
    productSize = json['product_size'];
    basePrice = json['base_price'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    descriptionEn = json['description_en'];
    productThumbnail = json['product_thumbnail'];
    trend = json['trend'];
    newProduct = json['new_product'];
    offer = json['offer'];
    colors = json['colors'].cast<String>();
    images = json['images'].cast<String>();
    if (json['ratings'] != null) {
      ratings = <HomeDataRatingsResponse>[];
      json['ratings'].forEach((v) {
        ratings!.add(HomeDataRatingsResponse.fromJson(v));
      });
    }
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    data['product_name'] = productName;
    data['brand'] = brand;
    data['product_qty'] = productQty;
    data['product_size'] = productSize;
    data['base_price'] = basePrice;
    data['selling_price'] = sellingPrice;
    data['discount_price'] = discountPrice;
    data['description_en'] = descriptionEn;
    data['product_thumbnail'] = productThumbnail;
    data['trend'] = trend;
    data['new_product'] = newProduct;
    data['offer'] = offer;
    data['colors'] = colors;
    data['images'] = images;
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }
}

class HomeDataRatingsResponse {
  int? id;
  int? productId;
  int? customerId;
  String? comments;
  int? starRating;
  String? createdAt;
  String? updatedAt;

  HomeDataRatingsResponse(
      {this.id,
        this.productId,
        this.customerId,
        this.comments,
        this.starRating,
        this.createdAt,
        this.updatedAt});

  HomeDataRatingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    comments = json['comments'];
    starRating = json['star_rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['customer_id'] = customerId;
    data['comments'] = comments;
    data['star_rating'] = starRating;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class HomeDataSlidersResponse {
  int? id;
  String? titleAr;
  String? titleEn;
  String? textAr;
  String? textEn;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  HomeDataSlidersResponse(
      {this.id,
        this.titleAr,
        this.titleEn,
        this.textAr,
        this.textEn,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  HomeDataSlidersResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    textAr = json['text_ar'];
    textEn = json['text_en'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title_ar'] = titleAr;
    data['title_en'] = titleEn;
    data['text_ar'] = textAr;
    data['text_en'] = textEn;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class HomeDataCategoriesResponse {
  int? id;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;
  List<HomeDataSubCategoryResponse>? subCategory;

  HomeDataCategoriesResponse(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.createdAt,
        this.updatedAt,
        this.subCategory});

  HomeDataCategoriesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['sub_category'] != null) {
      subCategory = <HomeDataSubCategoryResponse>[];
      json['sub_category'].forEach((v) {
        subCategory!.add(HomeDataSubCategoryResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subCategory != null) {
      data['sub_category'] = subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeDataSubCategoryResponse {
  int? id;
  int? categoryId;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;

  HomeDataSubCategoryResponse(
      {this.id,
        this.categoryId,
        this.nameEn,
        this.nameAr,
        this.createdAt,
        this.updatedAt});

  HomeDataSubCategoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}