import 'package:store_app/features/home/data/mapper/sub_category_response_mapper.dart';

import '../../domain/model/categories_model.dart';
import '../response/categories_response.dart';
import 'package:store_app/core/extensions/extensions.dart';

extension CategoriesResponseMapper on CategoriesResponse {
  CategoriesModel toDomain() {
    return CategoriesModel(
      id: id.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
      nameEn: nameEn.onNull(),
      nameAr: nameAr.onNull(),
      subCategory: subCategory!.map((e) => e.toDomain()).toList(),
    );
  }
}
