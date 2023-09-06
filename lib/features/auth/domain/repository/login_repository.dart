import 'package:dartz/dartz.dart';
import 'package:store_app/features/auth/domain/model/login_model.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../data/request/login_request.dart';

abstract class LoginRepository{
  Future<Either<Failure,LoginModel>> login(LoginRequest loginRequest);
}