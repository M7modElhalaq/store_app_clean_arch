import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';

import '../entities/customer.dart';
import '../repos/customer_reps.dart';

class LoginUseCase {
  final CustomerRep repo;

  LoginUseCase(this.repo);

  Future<Either<Failure, Customer>> call(int phoneNumber) async {
    return await repo.login(phoneNumber);
  }
}