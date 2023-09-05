import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../models/cart_model.dart';

abstract class CartGetDataRepository {
  Future<Either<Failure, CartModel>> getCartData();
}