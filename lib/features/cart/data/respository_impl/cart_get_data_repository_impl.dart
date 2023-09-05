import 'package:dartz/dartz.dart';

import 'package:store_app/core/error_handler/error_handler.dart';
import 'package:store_app/features/cart/data/mapper/cart_response_mapper.dart';
import 'package:store_app/features/cart/domain/repository/cart_get_data_repository.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/models/cart_model.dart';
import '../data_source/remote_cart_get_data_source.dart';

class CartGetDataRepositoryImpl implements CartGetDataRepository {
  final RemoteCartGetDataSource _remoteCartGetDataSource;
  final NetworkInfo _networkInfo;

  CartGetDataRepositoryImpl(this._remoteCartGetDataSource, this._networkInfo);

  @override
  Future<Either<Failure, CartModel>> getCartData() async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteCartGetDataSource.getCartData();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION));
    }
  }
}