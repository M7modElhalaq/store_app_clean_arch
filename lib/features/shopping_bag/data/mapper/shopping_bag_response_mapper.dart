import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/shopping_bag/data/mapper/shopping_bag_data_response_mapper.dart';
import 'package:store_app/features/shopping_bag/domain/model/shopping_bag_model.dart';

import '../response/shopping_bag_response.dart';

extension ShoppingBagResponseMapper on ShoppingBagResponse {
  ShoppingBagModel toDomain() {
    return ShoppingBagModel(
      success: success.onNull(),
      message: message.onNull(),
      data: data!.toDomain(),
    );
  }
}
