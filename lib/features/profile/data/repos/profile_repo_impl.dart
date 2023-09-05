import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/internet_checker/interent_checker.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:store_app/features/profile/data/models/customer_model.dart';
import 'package:store_app/features/profile/domain/entities/customer.dart';
import 'package:store_app/features/profile/domain/repos/profile_reps.dart';

class ProfileRepoImpl implements ProfileRep {
  final ProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();

  ProfileRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CustomerModel>> getCustomerData() async {
    if(await networkInfo.isConnected) {
      try {
        int phoneNumber = appSettingsSharedPreferences.defaultPhoneNumber;
        CustomerModel data = await remoteDataSource.getCustomerData(phoneNumber);
        return Right(data);
      } on UserNotFoundException {
        return Left(UserNotFoundFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> updateProfile(Customer customer, File image) async {
    print(image);
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
        bool update = await remoteDataSource.updateProfile(customerModel,image);
        if(update) {
          CustomerModel model = await remoteDataSource.getCustomerData(customerModel.phoneNumber);
          appSettingsSharedPreferences.setPhoneNumber(model.phoneNumber);
          return Right(model);
        } else {
          return Left(UpdateProfileFailure());
        }
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
