import 'package:dartz/dartz.dart';
import 'package:store_app/features/favourites/domain/model/favorites_model.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repository/favorites_get_data_repository.dart';

class GetFavoritesDataUseCase implements BaseGetUseCase {
  final FavoritesRepository _repository;

  GetFavoritesDataUseCase(this._repository);

  @override
  Future<Either<Failure, FavoritesModel>> execute() async {
    return await _repository.getFavoritesData();
  }
}