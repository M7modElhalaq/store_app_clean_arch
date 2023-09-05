import 'package:dartz/dartz.dart';

import 'package:store_app/core/error_handler/error_handler.dart';
import 'package:store_app/features/sub_category_products/data/mapper/sub_category_products_response_mapper.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/model/sub_category_products_model.dart';
import '../../domain/repository/get_sub_category_products_repository.dart';
import '../data_source/remote_get_sub_products_data_source.dart';

class GetSubCategoryProductsRepositoryImpl implements GetSubCategoryProductsRepository {
  final RemoteGetSubProductsDataDataSource _remoteGetSubProductsDataDataSource;
  final NetworkInfo _networkInfo;

  GetSubCategoryProductsRepositoryImpl(this._remoteGetSubProductsDataDataSource, this._networkInfo);

  @override
  Future<Either<Failure, SubCategoryModel>> getSubCategoryProducts(int id) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteGetSubProductsDataDataSource.getSubCategoryProducts(id);
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