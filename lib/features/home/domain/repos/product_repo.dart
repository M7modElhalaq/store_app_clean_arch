import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/home/domain/entities/product.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<Product>>> getProducts(String type);
}
