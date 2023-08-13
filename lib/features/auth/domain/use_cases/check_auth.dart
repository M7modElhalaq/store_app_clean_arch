import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';

import '../entities/customer.dart';
import '../repos/customer_reps.dart';

class CheckAuthUseCase {
  final CustomerRep repo;

  CheckAuthUseCase(this.repo);

  Future<Either<Failure, Customer>> call() async {
    return await repo.checkAuth();
  }
}