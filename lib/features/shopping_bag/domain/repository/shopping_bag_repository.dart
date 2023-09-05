import 'package:dartz/dartz.dart';
import 'package:store_app/features/shopping_bag/domain/model/shopping_bag_model.dart';

import '../../../../core/error_handler/error_handler.dart';

abstract class ShoppingBagRepository{
  Future<Either<Failure, ShoppingBagModel>> getShoppingBagData();
}