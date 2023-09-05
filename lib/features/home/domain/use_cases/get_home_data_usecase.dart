import 'package:dartz/dartz.dart';
import 'package:store_app/core/error_handler/error_handler.dart';
import 'package:store_app/core/usecase/base_usecase.dart';
import 'package:store_app/features/home/domain/repos/home_repository.dart';

import '../model/home_model.dart';

class GetHomeDataUseCase implements BaseGetUseCase {
  final HomeRepository _repository;

  GetHomeDataUseCase(this._repository);

  @override
  Future<Either<Failure, HomeModel>> execute() async {
    return await _repository.getHomeData();
  }
}