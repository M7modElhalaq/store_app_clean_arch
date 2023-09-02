import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/customer.dart';

abstract class ProfileRep {
  Future<Either<Failure, Customer>> getCustomerData();
  Future<Either<Failure, Customer>> updateProfile(Customer customer, File image);
  Future<Either<Failure, Customer>> register(Customer customer);
  Future<Either<Failure, Unit>> logout();
}