import 'package:store_app/core/extensions/extensions.dart';

import '../../domain/model/sub_category_model.dart';
import '../response/sub_category_response.dart';

extension SubCategoryResponseMapper on SubCategoryResponse {
  SubCategoryModel toDomain() {
    return SubCategoryModel(
      id: id.onNull(),
      createdAt: createdAt.onNull(),
      updatedAt: updatedAt.onNull(),
      nameEn: nameEn.onNull(),
      nameAr: nameAr.onNull(),
      categoryId: categoryId.onNull(),
    );
  }
}
