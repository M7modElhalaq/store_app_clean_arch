import 'package:dartz/dartz.dart';
import 'package:store_app/features/cart/domain/entities/cart_model.dart';

import '../../../../core/errors/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> getCartData();
}