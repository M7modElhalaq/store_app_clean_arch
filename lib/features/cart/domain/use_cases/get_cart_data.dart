import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/cart/domain/entities/cart_model.dart';
import 'package:store_app/features/cart/domain/repos/cart_repo.dart';

class GetCartUseCase {
  final CartRepo repo;

  GetCartUseCase(this.repo);

  Future<Either<Failure, CartModel>> call() async {
    return await repo.getCartData();
  }
}