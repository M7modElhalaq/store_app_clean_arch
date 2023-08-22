import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/network/network_info.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';
import 'package:store_app/features/auth/domain/repos/customer_reps.dart';

import '../datasources/remote_data_source.dart';
import '../models/customer_model.dart';

class CustomerRepoImpl implements CustomerRep {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();

  CustomerRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Customer>> login(int phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        CustomerModel customer = await remoteDataSource.login(phoneNumber);
        print(customer.phoneNumber);
        return Right(customer);
      } on NotRegisteredException {
        print('NotRegisteredException');
        // String verifiyId = await remoteDataSource.verifyPhone(phoneNumber);
        return Left(NotRegisteredFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> verifyPhone(int phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        String verifyId = await remoteDataSource.verifyPhone(phoneNumber);
        return Right(verifyId);
      } catch(e) {
        return Left(SendVerifyCodeFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> register(Customer customer) async {
    final CustomerModel customerModel = CustomerModel(
      name: customer.name,
      email: customer.email,
      phoneNumber: customer.phoneNumber,
      profileImage: customer.profileImage ?? '',
      dateOfBirth: customer.dateOfBirth ?? '',
      idNumber: customer.idNumber ?? 0,
      gender: customer.gender ?? '',
      lang: customer.lang ?? '',
      token: customer.token ?? '',
    );

    if(await networkInfo.isConnected) {
      try {
        await remoteDataSource.register(customerModel);
        appSettingsSharedPreferences.setPhoneNumber(customerModel.phoneNumber);
        return Right(customerModel);
      } on RegisterException {
        return Left(RegisterFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> updateProfile(Customer customer) async {
    // print('updateProfile From Remote');
    // print(customer);
    final CustomerModel customerModel = CustomerModel(
      name: customer.name,
      email: customer.email,
      phoneNumber: customer.phoneNumber,
      profileImage: customer.profileImage,
      dateOfBirth: customer.dateOfBirth,
      idNumber: customer.idNumber,
      gender: customer.gender,
      lang: customer.lang,
      token: customer.token,
    );

    if(await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProfile(customerModel);
        appSettingsSharedPreferences.setPhoneNumber(customerModel.phoneNumber);
        return Right(customerModel);
      } on UpdateProfileException {
        return Left(UpdateProfileFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await appSettingsSharedPreferences.clear();
      return Right(unit);
    } on EmptyCacheException {
      throw EmptyCacheFailure();
    }
  }
}
