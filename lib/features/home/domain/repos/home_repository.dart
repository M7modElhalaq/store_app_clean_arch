import 'package:dartz/dartz.dart';
import 'package:store_app/core/error_handler/error_handler.dart';

import '../model/home_model.dart';

abstract class HomeRepository{
  Future<Either<Failure, HomeModel>> getHomeData();
}