class CartResponse {
  bool? success;
  String? message;
  List<DataResponse>? data;

  CartResponse({this.success, this.message, this.data});

  CartResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataResponse>[];
      json['data'].forEach((v) {
        data!.add(DataResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataResponse {
  int? id;
  int? customerId;
  int? productId;
  String? productColor;
  int? productSize;
  int? productQty;
  CartResponseProduct? product;

  DataResponse({
    this.id,
    this.customerId,
    this.productId,
    this.productColor,
    this.productSize,
    this.productQty,
    this.product,
  });

  DataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    productQty = json['product_qty'];
    product = json['product'] != null
        ? CartResponseProduct.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['product_id'] = productId;
    data['product_color'] = productColor;
    data['product_size'] = productSize;
    data['product_qty'] = productQty;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class CartResponseProduct {
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
  List<int>? images;
  List<CartResponseProductRatings>? ratings;
  bool? inFavorites;
  bool? inCart;

  CartResponseProduct({
    this.id,
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
    this.inCart,
  });

  CartResponseProduct.fromJson(Map<String, dynamic> json) {
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
    if (json['colors'] != null) {
      colors = <String>[];
      json['colors'];
    }
    if (json['images'] != null) {
      images = <int>[];
      json['images'];
    }
    if (json['ratings'] != null) {
      ratings = <CartResponseProductRatings>[];
      json['ratings'].forEach((v) {
        ratings!.add(CartResponseProductRatings.fromJson(v));
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
    if (colors != null) {
      data['colors'] = colors!;
    }
    if (images != null) {
      data['images'] = images!;
    }
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }
}

class CartResponseProductRatings {
  int? id;
  int? productId;
  int? customerId;
  String? comments;
  int? starRating;
  String? createdAt;
  String? updatedAt;

  CartResponseProductRatings({
    this.id,
    this.productId,
    this.customerId,
    this.comments,
    this.starRating,
    this.createdAt,
    this.updatedAt,
  });

  CartResponseProductRatings.fromJson(Map<String, dynamic> json) {
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
