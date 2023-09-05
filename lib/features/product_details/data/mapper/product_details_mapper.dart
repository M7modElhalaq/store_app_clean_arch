import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/product_details/data/mapper/product_details_data_mapper.dart';
import '../../domain/model/product_details_model.dart';
import '../response/product_details_response.dart';

extension ProductDetailsMapper on ProductDetailsResponse {
  ProductDetailsModel toDomain() {
    return ProductDetailsModel(
      message: message.onNull(),
      success: success.onNull(),
      data: data!.toDomain(),
    );
  }
}