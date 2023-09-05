import 'package:dartz/dartz.dart';

import 'package:store_app/core/error_handler/error_handler.dart';
import 'package:store_app/features/product_details/data/mapper/product_details_mapper.dart';

import 'package:store_app/features/product_details/domain/model/product_details_model.dart';

import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/product_details_repository.dart';
import '../data_source/remote_product_details_data_source.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final RemoteProductDetailsDataSource _remoteProductDetailsDataSource;
  final NetworkInfo _networkInfo;

  ProductDetailsRepositoryImpl(this._remoteProductDetailsDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ProductDetailsModel>> productDetails(int id) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteProductDetailsDataSource.productDetails(id);
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