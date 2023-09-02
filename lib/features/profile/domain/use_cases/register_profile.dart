import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/profile/domain/entities/customer.dart';
import 'package:store_app/features/profile/domain/repos/profile_reps.dart';


class RegisterProfileUseCase {
  final ProfileRep repo;

  RegisterProfileUseCase(this.repo);

  Future<Either<Failure, Customer>> call(Customer customer) async {
    return await repo.register(customer);
  }
}