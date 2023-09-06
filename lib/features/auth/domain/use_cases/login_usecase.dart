import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/login_request.dart';
import '../model/login_model.dart';
import '../repository/login_repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, LoginModel>{
  final  LoginRepository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, LoginModel>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(phoneNumber : input.phoneNumber));
  }
}


class LoginUseCaseInput{
  int phoneNumber;
  LoginUseCaseInput({required this.phoneNumber});
}