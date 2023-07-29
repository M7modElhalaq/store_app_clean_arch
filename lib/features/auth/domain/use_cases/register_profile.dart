import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';

import '../entities/customer.dart';
import '../repos/customer_reps.dart';

class RegisterProfileUseCase {
  final CustomerRep repo;

  RegisterProfileUseCase(this.repo);

  Future<Either<Failure, Unit>> call(Customer customer) async {
    return await repo.register(customer);
  }
}