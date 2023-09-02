import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/profile/domain/repos/profile_reps.dart';

class LogoutUseCase {
  final ProfileRep repo;

  LogoutUseCase(this.repo);

  Future<Either<Failure, Unit>> call() async {
    return await repo.logout();
  }
}