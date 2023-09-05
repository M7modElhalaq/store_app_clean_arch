import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/sub_category_products/data/mapper/sub_category_products_data_response_mapper.dart';

import '../../domain/model/sub_category_products_model.dart';
import '../response/sub_category_products_response.dart';

extension SubCategoryProductsResponseMapper on SubCategoryResponse {
  SubCategoryModel toDomain() {
    return SubCategoryModel(
      success: success.onNull(),
      message: message.onNull(),
      subCategoryName: subCategoryName.onNull(),
      data: data!.map((e) => e.toDomain()).toList(),
    );
  }
}