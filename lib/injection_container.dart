import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:store_app/features/auth/data/repos/customer_repo_impl.dart';
import 'package:store_app/features/auth/domain/use_cases/check_auth.dart';
import 'package:store_app/features/auth/domain/use_cases/verify_phone.dart';
import 'package:store_app/features/auth/presentation/bloc/auth/auth_bloc.dart';

import 'core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/datasources/local_data_source.dart';
import 'features/auth/data/datasources/remote_data_source.dart';
import 'features/auth/domain/repos/customer_reps.dart';
import 'features/auth/domain/use_cases/login.dart';
import 'features/auth/domain/use_cases/register_profile.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => AuthBloc(checkAuth: sl()));
  sl.registerFactory(() => LoginBloc(login: sl(), verifyPhone: sl(), register: sl()));

// Usecases

  sl.registerLazySingleton(() => CheckAuthUseCase(sl()));

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => VerifyPhoneUseCase(sl()));
  sl.registerLazySingleton(() => RegisterProfileUseCase(sl()));

// Repository

  sl.registerLazySingleton<CustomerRep>(() => CustomerRepoImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl());
  sl.registerLazySingleton<LocalDataSource>(
          () => LocalDataSourceImpl(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}