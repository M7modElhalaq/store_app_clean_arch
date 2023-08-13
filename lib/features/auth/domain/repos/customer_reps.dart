import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/customer.dart';

abstract class CustomerRep {
  Future<Either<Failure, Customer>> checkAuth(); // If registered then go to Home Page
  Future<Either<Failure, Customer>> login(int phoneNumber);
  Future<Either<Failure, String>> verifyPhone(int phoneNumber);
  Future<Either<Failure, Customer>> register(Customer customer);
  Future<Either<Failure, Customer>> updateProfile(Customer customer);
  Future<Either<Failure, Unit>> logout();
}