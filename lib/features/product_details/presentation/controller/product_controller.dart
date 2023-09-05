import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';
import 'package:store_app/features/product_details/domain/model/product_details_model.dart';
import 'package:store_app/features/product_details/domain/usecase/product_details_usecase.dart';

import '../../../../config/dependancy_injection.dart';

class ProductController extends GetxController {
  late AppSettingsSharedPreferences appSettingsSharedPreferences;
  late AppRemoteDataSource appRemoteDataSource;
  ProductDetailsUseCase productDetailsUseCase = sl<ProductDetailsUseCase>();
  int isLoading = 0;
  int qty = 1;
  int productId = 0;
  late ProductDetailsModel product;
  List sizes = [];
  List<int> selectedColors = [];
  List<int> selectedSizes = [];

  @override
  void onInit() {
    super.onInit();
    print('Product Init');
    appSettingsSharedPreferences = AppSettingsSharedPreferences();
    appRemoteDataSource = AppRemoteDataSource();
    final args = Get.rootDelegate.parameters;
    print(Get.rootDelegate.arguments());
    isLoading = 1;
    print('Init Product Details Controller');
    getProductDetails();
    update();
  }

  @override
  void onReady() {
    super.onReady();
    print(Get.arguments);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProductDetails() async {
    (await productDetailsUseCase.execute(1)).fold((l) {
      print(l);
    }, (r) {
      print(r);
    });
  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    await appRemoteDataSource.addOrRemoveFavorite(context,
        productId: productIndex);
    update();
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    await appRemoteDataSource.addOrRemoveCart(context, productId: productIndex);
    update();
  }

  void increaseQty() {
    if (qty <
        int.parse(product.data.productQty)) {
      qty++;
    }
    update();
  }

  void decreaseQty() {
    if (qty > 1) {
      qty--;
    }
    update();
  }

  void addOrDeleteFromSelectedColors(int index) {
    if (selectedColors.contains(index)) {
      selectedColors.remove(index);
    } else {
      selectedColors.add(index);
    }
    update();
  }

  void addOrDeleteFromSelectedSizes(int index) {
    if (selectedSizes.contains(index)) {
      selectedSizes.remove(index);
    } else {
      selectedSizes.add(index);
    }
    update();
  }
}
