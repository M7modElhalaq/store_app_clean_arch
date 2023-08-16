import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:store_app/features/auth/data/repos/customer_repo_impl.dart';
import 'package:store_app/features/auth/domain/use_cases/check_auth.dart';
import 'package:store_app/features/auth/domain/use_cases/logout.dart';
import 'package:store_app/features/auth/domain/use_cases/update_profile.dart';
import 'package:store_app/features/home/data/datasources/product_local_data_source.dart';
import 'package:store_app/features/home/data/datasources/product_remote_data_source.dart';
import 'package:store_app/features/home/data/repos/product_repo_impl.dart';
import 'package:store_app/features/home/domain/repos/product_repo.dart';
import 'package:store_app/features/home/domain/use_cases/get_products.dart';
import 'package:store_app/features/home/presentation/bloc/product/product_bloc.dart';

import '../core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/data/datasources/local_data_source.dart';
import '../features/auth/data/datasources/remote_data_source.dart';
import '../features/auth/domain/repos/customer_reps.dart';
import '../features/auth/domain/use_cases/login.dart';
import '../features/auth/domain/use_cases/register_profile.dart';
import '../features/auth/presentation/bloc/login/login_bloc.dart';
import '../features/main_app/presentation/manager/drawer_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc
  sl.registerFactory(
    () => LoginBloc(
      login: sl(),
      register: sl(),
      checkAuth: sl(),
      updateProfile: sl(),
      logoutUseCase: sl(),
    ),
  );
  sl.registerFactory(() => DrawerCubit());
  sl.registerFactory(
    () => ProductBloc(
      getProducts: sl(),
    ),
  );

// Usecases

  sl.registerLazySingleton(() => CheckAuthUseCase(sl()));

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));

  sl.registerLazySingleton(() => GetProductsUseCase(sl()));

// Repository

  sl.registerLazySingleton<CustomerRep>(() => CustomerRepoImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<ProductRepo>(() => ProductRepoImp(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl());
  sl.registerLazySingleton<ProductLocalDataSource>(
          () => ProductLocalDataSourceImpl(sharedPreferences: sl()));
//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
