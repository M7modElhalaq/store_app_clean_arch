import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/cart/data/mapper/cart_data_response_mapper.dart';

import '../../domain/models/cart_model.dart';
import '../response/cart_response.dart';

extension CartResponseMapper on CartResponse {
  CartModel toDomain() {
    return CartModel(
      success: success.onNull(),
      message: message.onNull(),
      data: data!.map((e) => e.toDomain()).toList(),
    );
  }
}