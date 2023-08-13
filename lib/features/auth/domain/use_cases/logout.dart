import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';

import '../entities/customer.dart';
import '../repos/customer_reps.dart';

class LogoutUseCase {
  final CustomerRep repo;

  LogoutUseCase(this.repo);

  Future<Either<Failure, Unit>> call() async {
    return await repo.logout();
  }
}