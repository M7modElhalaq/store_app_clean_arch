import 'package:dartz/dartz.dart';
import 'package:store_app/core/error_handler/error_handler.dart';

abstract class BaseUseCase<In, Out>{
  Future<Either<Failure,Out>> execute(In input);
}

abstract class BaseGetUseCase<Out>{
  Future<Either<Failure,Out>> execute();
}