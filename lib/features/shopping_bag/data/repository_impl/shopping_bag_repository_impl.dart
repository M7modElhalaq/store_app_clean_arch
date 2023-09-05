import 'package:dartz/dartz.dart';
import 'package:store_app/core/error_handler/error_handler.dart';
import 'package:store_app/features/shopping_bag/data/mapper/shopping_bag_response_mapper.dart';
import 'package:store_app/features/shopping_bag/domain/model/shopping_bag_model.dart';
import 'package:store_app/features/shopping_bag/domain/repository/shopping_bag_repository.dart';

import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../data_source/remote_shopping_bag_data_source.dart';

class ShoppingBagRepositoryImpl implements ShoppingBagRepository {
  final RemoteShoppingBagDataSource _remoteShoppingBagDataSource;
  final NetworkInfo _networkInfo;
  ShoppingBagRepositoryImpl(this._remoteShoppingBagDataSource, this._networkInfo);
  @override
  Future<Either<Failure, ShoppingBagModel>> getShoppingBagData() async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteShoppingBagDataSource.getShoppingBagData();
      return Right(response.toDomain());
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.noInternetErrorMessage),);
    }
  }
}