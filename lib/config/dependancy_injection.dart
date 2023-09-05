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
import 'package:store_app/features/cart/data/data_source/remote_cart_get_data_source.dart';
import 'package:store_app/features/cart/data/respository_impl/cart_get_data_repository_impl.dart';
import 'package:store_app/features/cart/domain/repository/cart_get_data_repository.dart';
import 'package:store_app/features/cart/presentation/controller/cart_controller.dart';
import 'package:store_app/features/favourites/data/data_source/remote_product_details_data_source.dart';
import 'package:store_app/features/favourites/domain/usecase/get_favorites_data_usecase.dart';
import 'package:store_app/features/favourites/presentation/controller/favorites_controller.dart';
import 'package:store_app/features/home/data/datasources/remote_home_data_source.dart';
import 'package:store_app/features/home/data/repos/home_repository_impl.dart';
import 'package:store_app/features/home/domain/repos/home_repository.dart';
import 'package:store_app/features/home/domain/use_cases/get_home_data_usecase.dart';
import 'package:store_app/features/home/presentation/controller/home_controller.dart';
import 'package:store_app/features/product_details/data/data_source/remote_product_details_data_source.dart';
import 'package:store_app/features/product_details/domain/usecase/product_details_usecase.dart';
import 'package:store_app/features/product_details/presentation/controller/product_controller.dart';
import 'package:store_app/features/profile/domain/repos/profile_reps.dart';
import 'package:store_app/features/profile/domain/use_cases/register_profile.dart';
import 'package:store_app/features/profile/presentation/controller/profile_controller.dart';
import 'package:store_app/features/profile/presentation/controller/settings_controller.dart';
import 'package:store_app/features/splash/presentation/controller/splash_controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/features/auth/data/repos/customer_repo_impl.dart';
import 'package:store_app/features/profile/domain/use_cases/logout.dart';
import 'package:store_app/features/profile/domain/use_cases/update_profile.dart';
import 'package:store_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:store_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:store_app/features/profile/domain/use_cases/get_customer_data.dart';
import 'package:store_app/features/sub_category_products/data/data_source/remote_get_sub_products_data_source.dart';
import 'package:store_app/features/sub_category_products/domain/repository/get_sub_category_products_repository.dart';

import '../features/cart/domain/usecase/get_cart_data_usecase.dart';
import '../features/favourites/data/respository_impl/favorites_repository_impl.dart';
import '../features/favourites/domain/repository/favorites_get_data_repository.dart';
import '../features/product_details/data/respository_impl/product_details_repository_impl.dart';
import '../features/product_details/domain/repository/product_details_repository.dart';
import '../features/sub_category_products/data/respository_impl/get_sub_category_products_repository_impl.dart';
import '../features/sub_category_products/domain/usecase/get_sub_category_products_usecase.dart';
import '../features/sub_category_products/presentation/controller/sub_category_controller.dart';

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
  disposeSubCategory();

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
  initFav();
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

  if (!GetIt.I.isRegistered<RemoteCartGetDataSource>()) {
    sl.registerLazySingleton<RemoteCartGetDataSource>(
            () => RemoteCartGetDataSourceImpl(sl()));
  }

  if (!GetIt.I.isRegistered<CartGetDataRepository>()) {
    sl.registerLazySingleton<CartGetDataRepository>(
          () => CartGetDataRepositoryImpl(sl(), sl()),
    );
  }

  if (!GetIt.I.isRegistered<GetCartDataUseCase>()) {
    sl.registerFactory<GetCartDataUseCase>(
          () => GetCartDataUseCase(
        sl<CartGetDataRepository>(),
      ),
    );
  }

  Get.put<CartController>(CartController());
}

disposeCart() {
  Get.delete<CartController>();

  if (GetIt.I.isRegistered<RemoteCartGetDataSource>()) {
    sl.unregister<RemoteCartGetDataSource>();
  }

  if (GetIt.I.isRegistered<CartGetDataRepository>()) {
    sl.unregister<CartGetDataRepository>();
  }

  if (GetIt.I.isRegistered<GetCartDataUseCase>()) {
    sl.unregister<GetCartDataUseCase>();
  }
}

initFav() {

  if (!GetIt.I.isRegistered<RemoteFavoritesDataSource>()) {
    sl.registerLazySingleton<RemoteFavoritesDataSource>(
            () => RemoteFavoritesDataSourceImpl(sl()));
  }

  if (!GetIt.I.isRegistered<FavoritesRepository>()) {
    sl.registerLazySingleton<FavoritesRepository>(
          () => FavoritesRepositoryImpl(sl(), sl()),
    );
  }

  if (!GetIt.I.isRegistered<GetFavoritesDataUseCase>()) {
    sl.registerFactory<GetFavoritesDataUseCase>(
          () => GetFavoritesDataUseCase(
        sl<FavoritesRepository>(),
      ),
    );
  }

  Get.put<FavoritesController>(FavoritesController());
}

disposeFav() {
  Get.delete<FavoritesController>();

  if (GetIt.I.isRegistered<RemoteFavoritesDataSource>()) {
    sl.unregister<RemoteFavoritesDataSource>();
  }

  if (GetIt.I.isRegistered<FavoritesRepository>()) {
    sl.unregister<FavoritesRepository>();
  }

  if (GetIt.I.isRegistered<GetFavoritesDataUseCase>()) {
    sl.unregister<GetFavoritesDataUseCase>();
  }
}

initProduct() {
  disposeHome();
  disposeCart();
  disposeFav();
  disposeProfile();
  disposeSubCategory();

  if (!GetIt.I.isRegistered<RemoteProductDetailsDataSource>()) {
    sl.registerLazySingleton<RemoteProductDetailsDataSource>(
            () => RemoteProductDetailsDataSourceImpl(sl<AppService>()));
  }

  if (!GetIt.I.isRegistered<ProductDetailsRepository>()) {
    sl.registerLazySingleton<ProductDetailsRepository>(
          () => ProductDetailsRepositoryImpl(sl(), sl()),
    );
  }

  if (!GetIt.I.isRegistered<ProductDetailsUseCase>()) {
    sl.registerFactory<ProductDetailsUseCase>(
          () => ProductDetailsUseCase(
        sl<ProductDetailsRepository>(),
      ),
    );
  }

  Get.put<ProductController>(ProductController());
}

disposeProduct() {
  Get.delete<ProductController>();

  if (GetIt.I.isRegistered<RemoteProductDetailsDataSource>()) {
    sl.unregister<RemoteProductDetailsDataSource>();
  }

  if (GetIt.I.isRegistered<ProductDetailsRepository>()) {
    sl.unregister<ProductDetailsRepository>();
  }

  if (GetIt.I.isRegistered<ProductDetailsUseCase>()) {
    sl.unregister<ProductDetailsUseCase>();
  }
}

initSubCategory() {
  disposeHome();
  disposeCart();
  disposeFav();
  disposeProfile();
  disposeProduct();

  if (!GetIt.I.isRegistered<RemoteGetSubProductsDataDataSource>()) {
    sl.registerLazySingleton<RemoteGetSubProductsDataDataSource>(
            () => RemoteGetSubProductsDataDataSourceImpl(sl<AppService>()));
  }

  if (!GetIt.I.isRegistered<GetSubCategoryProductsRepository>()) {
    sl.registerLazySingleton<GetSubCategoryProductsRepository>(
          () => GetSubCategoryProductsRepositoryImpl(sl(), sl()),
    );
  }

  if (!GetIt.I.isRegistered<GetSubCategoryProductsUseCase>()) {
    sl.registerFactory<GetSubCategoryProductsUseCase>(
          () => GetSubCategoryProductsUseCase(
        sl<GetSubCategoryProductsRepository>(),
      ),
    );
  }

  Get.put<SubCategoryController>(SubCategoryController());
}

disposeSubCategory() {
  Get.delete<SubCategoryController>();

  if (GetIt.I.isRegistered<RemoteGetSubProductsDataDataSource>()) {
    sl.unregister<RemoteGetSubProductsDataDataSource>();
  }

  if (GetIt.I.isRegistered<GetSubCategoryProductsRepository>()) {
    sl.unregister<GetSubCategoryProductsRepository>();
  }

  if (GetIt.I.isRegistered<GetSubCategoryProductsUseCase>()) {
    sl.unregister<GetSubCategoryProductsUseCase>();
  }
}

initProfile() {
  if (!GetIt.I.isRegistered<ProfileRemoteDataSource>()) {
    sl.registerLazySingleton<ProfileRemoteDataSource>(
            () => ProfileRemoteDataSourceImpl());
  }

  if (!GetIt.I.isRegistered<ProfileRep>()) {
    sl.registerLazySingleton<ProfileRep>(
          () => ProfileRepoImpl(remoteDataSource: sl(), networkInfo: sl()),
    );
  }

  if (!GetIt.I.isRegistered<CustomerRep>()) {
    sl.registerLazySingleton<CustomerRep>(
          () => CustomerRepoImpl(remoteDataSource: sl(), networkInfo: sl()),
    );
  }

  if (!GetIt.I.isRegistered<UpdateProfileUseCase>()) {
    sl.registerFactory<UpdateProfileUseCase>(
          () => UpdateProfileUseCase(
        sl<ProfileRep>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<GetCustomerDataUseCase>()) {
    sl.registerFactory<GetCustomerDataUseCase>(
          () => GetCustomerDataUseCase(
        sl<ProfileRep>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    sl.registerFactory<LogoutUseCase>(
          () => LogoutUseCase(
        sl<ProfileRep>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterProfileUseCase>()) {
    sl.registerFactory<RegisterProfileUseCase>(
          () => RegisterProfileUseCase(
        sl<ProfileRep>(),
      ),
    );
  }

  Get.put<ProfileController>(ProfileController(getData: sl(), updateProfile: sl(), logoutUseCase: sl(), register: sl()));

}

disposeProfile() {
  if (GetIt.I.isRegistered<ProfileRemoteDataSource>()) {
    sl.unregister<ProfileRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<ProfileRep>()) {
    sl.unregister<ProfileRep>();
  }

  if (GetIt.I.isRegistered<CustomerRep>()) {
    sl.unregister<CustomerRep>();
  }

  if (GetIt.I.isRegistered<UpdateProfileUseCase>()) {
    sl.unregister<UpdateProfileUseCase>();
  }

  if (GetIt.I.isRegistered<GetCustomerDataUseCase>()) {
    sl.unregister<GetCustomerDataUseCase>();
  }

  if (GetIt.I.isRegistered<LogoutUseCase>()) {
    sl.unregister<LogoutUseCase>();
  }

  if (GetIt.I.isRegistered<RegisterProfileUseCase>()) {
    sl.unregister<RegisterProfileUseCase>();
  }

  Get.delete<ProfileController>();
}

initSettings() {
  Get.put<SettingsController>(SettingsController());
}

disposeSettings() {
  Get.delete<SettingsController>();
}