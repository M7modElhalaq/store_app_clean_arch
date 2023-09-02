import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/profile/domain/entities/customer.dart';
import 'package:store_app/features/profile/domain/repos/profile_reps.dart';


class UpdateProfileUseCase {
  final ProfileRep repo;

  UpdateProfileUseCase(this.repo);

  Future<Either<Failure, Customer>> call(Customer customer, File? image) async {
    return await repo.updateProfile(customer, image!);
  }
}