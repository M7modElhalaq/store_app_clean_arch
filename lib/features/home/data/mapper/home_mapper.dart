import 'package:store_app/core/base_model/home_model.dart';
import 'package:store_app/core/base_response/home_response.dart';
import 'package:store_app/core/extensions/extensions.dart';

extension HomeMapper on HomeResponse {
  HomeModel toDomain() {
    return HomeModel(
      status: status.onNull(),
      message: message.onNull(),
      data: data!.toDomain(),
    );
  }
}

extension HomeDataMapper on HomeDataResponse {
  HomeData toDomain() {
    return HomeData(
      products: products!.toDomain(),
      sliders: sliders!.map((e) => e.toDomain()).toList(),
      categories: categories!.map((e) => e.toDomain()).toList(),
    );
  }
}

extension HomeProductDataMapper on HomeDataProductsResponse {
  HomeDataProducts toDomain() {
    return HomeDataProducts(
      allProducts: allProducts!.map((e) => e.toDomain()).toList(),
      latestProducts: latestProducts!.map((e) => e.toDomain()).toList(),
      offerProducts: offerProducts!.map((e) => e.toDomain()).toList(),
      topProducts: topProducts!.map((e) => e.toDomain()).toList(),
    );
  }
}

extension HomeProductMapper on ProductsResponse{
  Products toDomain(){
    return Products(
      id: id.onNull(),
      categoryId: categoryId.onNull(),
      subcategoryId: subcategoryId.onNull(),
      productName: productName.onNull(),
      brand: brand.onNull(),
      productQty: productQty.onNull(),
      productSize: productSize.onNull(),
      basePrice: basePrice.onNull(),
      sellingPrice: sellingPrice.onNull(),
      discountPrice: discountPrice.onNull(),
      descriptionEn: descriptionEn.onNull(),
      productThumbnail: productThumbnail.onNull(),
      trend: trend.onNull(),
      newProduct: newProduct.onNull(),
      offer: offer.onNull(),
      colors: colors.onNull(),
      images: images.onNull(),
      ratings: ratings!.map((e) => e.toDomain()).toList(),
      inFavorites: inFavorites.onNull(),
      inCart: inCart.onNull(),
    );
  }
}

extension HomeProductRatingsDataMapper on HomeDataRatingsResponse {
  Ratings toDomain() {
    return Ratings(
      id: id.onNull(),
      productId: productId.onNull(),
      customerId: customerId.onNull(),
      comments: comments.onNull(),
      starRating: starRating.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
    );
  }
}

extension HomeSliderDataMapper on HomeDataSlidersResponse {
  Sliders toDomain() {
    return Sliders(
      id: id.onNull(),
      titleAr: titleAr.onNull(),
      titleEn: titleEn.onNull(),
      textAr: textAr.onNull(),
      textEn: textEn.onNull(),
      image: image.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
      deletedAt: deletedAt.onNull(),
    );
  }
}

extension HomeCategoryDataMapper on HomeDataCategoriesResponse {
  Categories toDomain() {
    return Categories(
      id: id.onNull(),
      nameEn: nameEn.onNull(),
      nameAr: nameAr.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
      subCategory: subCategory!.map((e) => e.toDomain()).toList(),
    );
  }
}

extension HomeSubCategoryDataMapper on HomeDataSubCategoryResponse {
  SubCategory toDomain() {
    return SubCategory(
      id: id.onNull(),
      categoryId: categoryId.onNull(),
      nameEn: nameEn.onNull(),
      nameAr: nameAr.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
    );
  }
}
