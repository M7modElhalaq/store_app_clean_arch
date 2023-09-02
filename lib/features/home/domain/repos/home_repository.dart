import 'package:dartz/dartz.dart';
import 'package:store_app/core/base_model/home_model.dart';
import 'package:store_app/core/error_handler/error_handler.dart';

abstract class HomeRepository{
  Future<Either<Failure, HomeModel>> getHomeData();
}