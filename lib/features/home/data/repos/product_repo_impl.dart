import 'package:dartz/dartz.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/network/network_info.dart';
import 'package:store_app/features/home/data/datasources/product_local_data_source.dart';
import 'package:store_app/features/home/data/datasources/product_remote_data_source.dart';
import 'package:store_app/features/home/domain/entities/product.dart';
import 'package:store_app/features/home/domain/repos/product_repo.dart';

import '../models/product_model.dart';

class ProductRepoImp implements ProductRepo {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepoImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts(String type) async {
    if (await networkInfo.isConnected) {
      try {
        List<ProductModel> products = await remoteDataSource.getProducts(type);
        localDataSource.cacheProducts(products, type);
        return Right(products);
      } on NoProductException {
        return Left(NoProductFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}