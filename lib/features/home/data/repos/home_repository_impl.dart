import 'package:dartz/dartz.dart';
import 'package:store_app/core/base_model/home_model.dart';
import 'package:store_app/core/error_handler/error_handler.dart';
import 'package:store_app/core/internet_checker/interent_checker.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/features/home/data/datasources/remote_home_data_source.dart';
import 'package:store_app/features/home/domain/repos/home_repository.dart';
import 'package:store_app/features/home/data/mapper/home_mapper.dart';

class HomeRepositoryImplement implements HomeRepository {
  final RemoteHomeDataSource _remoteLoginDataSource;
  final NetworkInfo _networkInfo;
  HomeRepositoryImplement(this._remoteLoginDataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteLoginDataSource.getHomeData();
      return Right(response.toDomain());
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.noInternetErrorMessage),);
    }
  }
}
