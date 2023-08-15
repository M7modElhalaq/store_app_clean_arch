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
    return ProductModel(
      id: json['id'],
      categoryId: json['categoryId'],
      subCategoryId: json['subCategoryId'],
      productNameEn: json['productNameEn'] ?? '',
      productNameAr: json['productNameAr'] ?? '',
      brandEn: json['brandEn'] ?? '',
      brandAr: json['brandAr'] ?? '',
      productQty: json['productQty'] ?? 0,
      productSize: json['productSize'] ?? '',
      basePrice: json['basePrice'] ?? 0,
      sellingPrice: json['sellingPrice'] ?? 0,
      discount: json['discount'] ?? 0,
      descriptionEn: json['descriptionEn'] ?? '',
      descriptionAr: json['descriptionAr'] ?? '',
      productThumbnail: json['productThumbnail'] ?? '',
      trend: json['trend'] ?? 0,
      newProduct: json['newProduct'] ?? 0,
      offer: json['offer'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      colors: json['colors'] ?? [],
      multiImage: json['multiImage'] ?? [],
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
