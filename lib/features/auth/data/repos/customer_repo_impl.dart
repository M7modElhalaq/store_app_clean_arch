import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/network/network_info.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';
import 'package:store_app/features/auth/domain/repos/customer_reps.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/customer_model.dart';

class CustomerRepoImpl implements CustomerRep {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CustomerRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> checkAuth() async {
    try {
      CustomerModel customer = await localDataSource.getCachedCustomer();
      return Right(unit);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> login(int phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        CustomerModel customer = await remoteDataSource.login(phoneNumber);
        localDataSource.cacheCustomer(customer);
        return Right(customer);
      } on NotRegisteredException {
        return Left(NotRegisteredFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyPhone(int phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.verifyPhone(phoneNumber);
        return Right(unit);
      } on NotVerifiedException {
        return Left(NotVerifiedFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> register(Customer customer) async {
    final CustomerModel customerModel = CustomerModel(
      name: customer.name,
      email: customer.email,
      phoneNumber: customer.phoneNumber,
      profileImage: customer.profileImage ?? '',
      dateOfBirth: customer.dateOfBirth ?? '',
      gender: customer.gender ?? '',
      lang: customer.lang ?? '',
      token: customer.token ?? '',
    );

    if(await networkInfo.isConnected) {
      try {
        await remoteDataSource.register(customerModel);
        await localDataSource.cacheCustomer(customerModel);
        return Right(unit);
      } on RegisterException {
        return Left(RegisterFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
