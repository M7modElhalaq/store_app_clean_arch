import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final int categoryId;
  final int subCategoryId;
  final String productNameEn;
  final String productNameAr;
  final String brandEn;
  final String brandAr;
  final int productQty;
  final String productSize;
  final double basePrice;
  final double sellingPrice;
  final int discount;
  final String descriptionEn;
  final String descriptionAr;
  final String productThumbnail;
  final bool trend;
  final bool newProduct;
  final bool offer;
  final String createdAt;
  final String updatedAt;
  final List<String> colors;
  final List<String> multiImage;

  Product({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.productNameEn,
    required this.productNameAr,
    required this.brandEn,
    required this.brandAr,
    required this.productQty,
    required this.productSize,
    required this.basePrice,
    required this.sellingPrice,
    required this.discount,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.productThumbnail,
    required this.trend,
    required this.newProduct,
    required this.offer,
    required this.createdAt,
    required this.updatedAt,
    required this.colors,
    required this.multiImage,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    categoryId,
    subCategoryId,
    productNameEn,
    productNameAr,
    brandEn,
    brandAr,
    productQty,
    productSize,
    basePrice,
    sellingPrice,
    discount,
    descriptionEn,
    descriptionAr,
    productThumbnail,
    trend,
    newProduct,
    offer,
    createdAt,
    updatedAt,
    colors,
    multiImage,
  ];

}

/*
*
*
  "multi_img": [],
  "ratings": []
*
* */
