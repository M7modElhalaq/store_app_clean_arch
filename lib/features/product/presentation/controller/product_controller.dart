import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/base_model/home_model.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';

class ProductController extends GetxController {
  late AppSettingsSharedPreferences appSettingsSharedPreferences;
  late AppRemoteDataSource appRemoteDataSource;
  int isLoading = 0;
  int qty = 1;
  Products? product;
  List sizes = [];
  List<int> selectedColors = [];
  List<int> selectedSizes = [];

  @override
  void onInit() {
    print('Product Init');
    super.onInit();
    appSettingsSharedPreferences = AppSettingsSharedPreferences();
    appRemoteDataSource = AppRemoteDataSource();

    isLoading = 1;
    update();
    BuildContext context = Get.context as BuildContext;

    ModalRoute modalRoute = ModalRoute.of(context)!;
    if (modalRoute != null &&
        modalRoute.settings != null &&
        modalRoute.settings.arguments != null) {
      Map<String, dynamic> args =
      modalRoute.settings.arguments as Map<String, dynamic>;
      product = args['product'];
      sizes = product!.productSize.split(',');
    }

    isLoading = 2;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void prepareData() {

  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    await appRemoteDataSource.addOrRemoveFavorite(context, productId: productIndex);
    update();
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    await appRemoteDataSource.addOrRemoveCart(context, productId: productIndex);
    update();
  }
}