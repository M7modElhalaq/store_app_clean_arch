import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/internet_checker/interent_checker.dart';
import 'package:store_app/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:store_app/features/cart/data/mapper/cart_mapper.dart';
import 'package:store_app/features/cart/data/models/cart_response.dart';
import 'package:store_app/features/cart/domain/entities/cart_model.dart';
import 'package:store_app/features/cart/domain/repos/cart_repo.dart';


class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;


  CartRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CartModel>> getCartData() async {
    if (await networkInfo.isConnected) {
      try {
        CartResponse cartResponse = await remoteDataSource.getCartData();
        CartModel cartModel = cartResponse.toDomain();
        return Right(cartModel);
      } on GetCartDataException {
        return Left(GetCartDataFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
