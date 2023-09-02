import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/profile/domain/entities/customer.dart';
import 'package:store_app/features/profile/domain/repos/profile_reps.dart';

class GetCustomerDataUseCase {
  final ProfileRep repo;

  GetCustomerDataUseCase(this.repo);

  Future<Either<Failure, Customer>> call() async {
    return await repo.getCustomerData();
  }
}