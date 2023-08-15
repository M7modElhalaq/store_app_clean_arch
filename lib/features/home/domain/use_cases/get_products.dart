import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/domain/entities/product.dart';
import 'package:store_app/features/home/domain/repos/product_repo.dart';

class GetProductsUseCase {
  final ProductRepo repo;

  GetProductsUseCase(this.repo);

  Future<Either<Failure, List<Product>>> call(String type) async {
    return await repo.getProducts(type);
  }
}