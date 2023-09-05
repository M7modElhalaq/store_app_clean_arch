import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/features/favourites/domain/model/favorites_model.dart';
import 'package:store_app/features/favourites/domain/usecase/get_favorites_data_usecase.dart';

import '../../../../config/dependancy_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/storage/remote/data_source/app_remote_data_source.dart';
import '../../../../routes/routes.dart';
import '../../../home/presentation/controller/home_controller.dart';

class FavoritesController extends GetxController with Helpers {
  late AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();
  GetFavoritesDataUseCase getFavoritesDataUseCase =
      sl<GetFavoritesDataUseCase>();
  CacheData cacheData = CacheData();
  int isLoading = 0;
  late FavoritesModel product;

  @override
  void onInit() {
    super.onInit();

    isLoading = 1;
    update();

    getFavoritesDetails();
  }

  void getFavoritesDetails() async {
    (await getFavoritesDataUseCase.execute()).fold((l) {
      isLoading = 2;
      print(l);
    }, (r) {
      isLoading = 0;
      product = r;
    });
    update();
  }

  void productDetails(context, int productId) {
    cacheData.setProductId(productId);
    Navigator.pushReplacementNamed(context, Routes.productView);
  }
}
