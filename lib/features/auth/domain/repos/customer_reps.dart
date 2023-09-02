import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/customer.dart';

abstract class CustomerRep {
  Future<Either<Failure, Customer>> login(int phoneNumber);
  Future<Either<Failure, String>> verifyPhone(int phoneNumber);
}