import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/internet_checker/interent_checker.dart';
import 'package:store_app/core/network/app_api.dart';
import 'package:store_app/core/network/dio_factory.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/features/auth/data/datasources/remote_data_source.dart';
import 'package:store_app/features/auth/domain/repos/customer_reps.dart';
import 'package:store_app/features/auth/domain/use_cases/login.dart';
import 'package:store_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:store_app/features/cart/presentation/controller/cart_controller.dart';
import 'package:store_app/features/home/data/datasources/remote_home_data_source.dart';
import 'package:store_app/features/home/data/repos/home_repository_impl.dart';
import 'package:store_app/features/home/domain/repos/home_repository.dart';
import 'package:store_app/features/home/domain/use_cases/get_home_data_usecase.dart';
import 'package:store_app/features/home/presentation/controller/home_controller.dart';
import 'package:store_app/features/product/presentation/controller/product_controller.dart';
import 'package:store_app/features/profile/domain/repos/profile_reps.dart';
import 'package:store_app/features/profile/domain/use_cases/register_profile.dart';
import 'package:store_app/features/profile/presentation/controller/profile_controller.dart';
import 'package:store_app/features/profile/presentation/controller/settings_controller.dart';
import 'package:store_app/features/splash/presentation/controller/splash_controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/features/auth/data/repos/customer_repo_impl.dart';
import 'package:store_app/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:store_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:store_app/features/cart/domain/repos/cart_repo.dart';
import 'package:store_app/features/cart/domain/use_cases/get_cart_data.dart';
import 'package:store_app/features/profile/domain/use_cases/logout.dart';
import 'package:store_app/features/profile/domain/use_cases/update_profile.dart';
import 'package:store_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:store_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:store_app/features/profile/domain/use_cases/get_customer_data.dart';

final sl = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();

  final sharedPreferences = await SharedPreferences.getInstance();

  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }

  if (!GetIt.I.isRegistered<AppSettingsSharedPreferences>()) {
    sl.registerLazySingleton<AppSettingsSharedPreferences>(
            () => AppSettingsSharedPreferences());
  }

  sl.registerLazySingleton(() => DioFactory());

  Dio dio = await sl<DioFactory>().getDio();
  sl.registerLazySingleton<AppService>(() => AppService(dio));

//! Core

  // Inject internet_checker
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    sl.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(InternetConnectionChecker()));
  }

//! External


  sl.registerLazySingleton(() => InternetConnectionChecker());
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initAuth() {
  disposeSplash();
  disposeHome();
  disposeProfile();
  disposeSettings();
  disposeCart();

  // Usecases

  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Datasources

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  Get.put<AuthController>(AuthController(login: sl()));
}

disposeAuth() {
  Get.delete<AuthController>();
}

initHome() {
  disposeSplash();
  disposeAuth();
  disposeProduct();

  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    sl.registerLazySingleton<RemoteHomeDataSource>(
            () => RemoteHomeDataSourceImpl(sl<AppService>()));
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    sl.registerLazySingleton<HomeRepository>(
          () => HomeRepositoryImplement(sl(), sl()),
    );
  }

  if (!GetIt.I.isRegistered<GetHomeDataUseCase>()) {
    sl.registerFactory<GetHomeDataUseCase>(
          () => GetHomeDataUseCase(
        sl<HomeRepository>(),
      ),
    );
  }

  Get.put<HomeController>(HomeController());
  initCart();
  initProfile();
}

disposeHome() {
  Get.delete<HomeController>();

  if (GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    sl.unregister<RemoteHomeDataSource>();
  }

  if (GetIt.I.isRegistered<HomeRepository>()) {
    sl.unregister<HomeRepository>();
  }

  if (GetIt.I.isRegistered<GetHomeDataUseCase>()) {
    sl.unregister<GetHomeDataUseCase>();
  }
}

initCart() {
  sl.registerLazySingleton(() => GetCartUseCase(sl()));

  sl.registerLazySingleton<CartRepo>(
          () => CartRepoImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<CartRemoteDataSource>(
          () => CartRemoteDataSourceImpl());

  Get.put<CartController>(CartController(getProducts: sl()));
}

disposeCart() {
  Get.delete<CartController>();
}

initProduct() {
  Get.put<ProductController>(ProductController());
}

disposeProduct() {
  Get.delete<ProductController>();
}

initProfile() {
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => GetCustomerDataUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => RegisterProfileUseCase(sl()));
  // Repository

  sl.registerLazySingleton<CustomerRep>(
          () => CustomerRepoImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<ProfileRep>(
          () => ProfileRepoImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<ProfileRemoteDataSource>(
          () => ProfileRemoteDataSourceImpl());

  Get.put<ProfileController>(ProfileController(getData: sl(), updateProfile: sl(), logoutUseCase: sl(), register: sl()));

}

disposeProfile() {
  Get.delete<ProfileController>();
}

initSettings() {
  Get.put<SettingsController>(SettingsController());
}

disposeSettings() {
  Get.delete<SettingsController>();
}