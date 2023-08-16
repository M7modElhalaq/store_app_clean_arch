import 'package:store_app/features/home/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.categoryId,
    required super.subCategoryId,
    required super.productNameEn,
    required super.productNameAr,
    required super.brandEn,
    required super.brandAr,
    required super.productQty,
    required super.productSize,
    required super.basePrice,
    required super.sellingPrice,
    required super.discount,
    required super.descriptionEn,
    required super.descriptionAr,
    required super.productThumbnail,
    required super.trend,
    required super.newProduct,
    required super.offer,
    required super.createdAt,
    required super.updatedAt,
    required super.colors,
    required super.multiImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> colors = json['colors'];
    return ProductModel(
      id: json['id'],
      categoryId: json['category_id'],
      subCategoryId: json['subcategory_id'],
      productNameEn: json['product_name_en'] ?? '',
      productNameAr: json['product_name_ar'] ?? '',
      brandEn: json['brand_en'] ?? '',
      brandAr: json['brand_ar'] ?? '',
      productQty: json['product_qty'] ?? "",
      productSize: json['product_size'] ?? '',
      basePrice: json['base_price'] / 1 ?? 0,
      sellingPrice: json['selling_price'] / 1 ?? 0,
      discount: json['discount_price'] / 1 ?? 0,
      descriptionEn: json['description_en'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      productThumbnail: json['product_thumbnail'] ?? '',
      trend: json['trend'] ?? 0,
      newProduct: json['new_product'] ?? 0,
      offer: json['offer'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      colors: colors.map((e) => e['color']).toList(),
      multiImage: [],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'productNameEn': productNameEn,
      'productNameAr': productNameAr,
      'brandEn': brandEn,
      'brandAr': brandAr,
      'productQty': productQty,
      'productSize': productSize,
      'basePrice': basePrice,
      'sellingPrice': sellingPrice,
      'discount': discount,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'productThumbnail': productThumbnail,
      'trend': trend,
      'newProduct': newProduct,
      'offer': offer,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'colors': colors,
      'multiImage': multiImage,
    };
  }
}
