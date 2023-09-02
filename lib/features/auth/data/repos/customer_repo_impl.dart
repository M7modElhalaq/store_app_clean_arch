import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/internet_checker/interent_checker.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';
import 'package:store_app/features/auth/domain/repos/customer_reps.dart';

import '../datasources/remote_data_source.dart';
import '../models/customer_model.dart';

class CustomerRepoImpl implements CustomerRep {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;


  CustomerRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Customer>> login(int phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        CustomerModel customer = await remoteDataSource.login(phoneNumber);
        // String smsVerifyCode = await remoteDataSource.sendSmsVerifyCode(phoneNumber);
        // print('smsVerifyCode: $smsVerifyCode');
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
}
