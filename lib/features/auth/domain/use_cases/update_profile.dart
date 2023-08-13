import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';

import '../entities/customer.dart';
import '../repos/customer_reps.dart';

class UpdateProfileUseCase {
  final CustomerRep repo;

  UpdateProfileUseCase(this.repo);

  Future<Either<Failure, Customer>> call(Customer customer) async {
    return await repo.updateProfile(customer);
  }
}