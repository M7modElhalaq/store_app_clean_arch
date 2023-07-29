import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';

import '../entities/customer.dart';
import '../repos/customer_reps.dart';

class VerifyPhoneUseCase {
  final CustomerRep repo;

  VerifyPhoneUseCase(this.repo);

  Future<Either<Failure, Unit>> call(int phoneNumber) async {
  return await repo.verifyPhone(phoneNumber);
  }
}