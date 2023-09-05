import 'package:dartz/dartz.dart';

import 'package:store_app/core/error_handler/error_handler.dart';
import 'package:store_app/features/favourites/data/mapper/favorites_response_mapper.dart';
import 'package:store_app/features/favourites/domain/model/favorites_model.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/favorites_get_data_repository.dart';
import '../data_source/remote_product_details_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final RemoteFavoritesDataSource _remoteFavoritesDataSource;
  final NetworkInfo _networkInfo;

  FavoritesRepositoryImpl(this._remoteFavoritesDataSource, this._networkInfo);

  @override
  Future<Either<Failure, FavoritesModel>> getFavoritesData() async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteFavoritesDataSource.getFavoritesData();
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