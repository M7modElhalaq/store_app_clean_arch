import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/features/favourites/domain/model/favorites_model.dart';
import 'package:store_app/features/favourites/domain/usecase/get_favorites_data_usecase.dart';

import '../../../../config/dependancy_injection.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/storage/remote/data_source/app_remote_data_source.dart';

class FavoritesController extends GetxController with Helpers {
  late AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();
  GetFavoritesDataUseCase getFavoritesDataUseCase =
      sl<GetFavoritesDataUseCase>();
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

  void addToFav(BuildContext context, {required int productIndex}) async {
    try {
      bool val = await appRemoteDataSource.addOrRemoveFavorite(context,
          productId: product.data[productIndex].id);
      (await getFavoritesDataUseCase.execute()).fold((l) {
        showSnackBar(
            context: context,
            message: ManagerStrings.failedAddToFav,
            error: true);
      }, (r) {
        product = r;
      });
    } on AddToFavFailure {
      showSnackBar(
          context: context,
          message: ManagerStrings.failedAddToFav,
          error: true);
    }
    update();
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    try {
      product.data[productIndex].inCart = !(product.data[productIndex].inCart);
      bool val = await appRemoteDataSource.addOrRemoveCart(context,
          productId: product.data[productIndex].id);
      if (!val) {
        product.data[productIndex].inCart = false;
      }
    } on AddToCartFailure {
      showSnackBar(
          context: context,
          message: ManagerStrings.failedAddToCart,
          error: true);
    }
    update();
  }
}
