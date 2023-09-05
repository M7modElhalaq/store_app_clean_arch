import 'package:dartz/dartz.dart';
import 'package:store_app/features/favourites/domain/model/favorites_model.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, FavoritesModel>> getFavoritesData();
}