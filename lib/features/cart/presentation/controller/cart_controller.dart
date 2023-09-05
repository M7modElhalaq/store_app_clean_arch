import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';
import 'package:store_app/core/widgets/helpers.dart';

import '../../../../config/dependancy_injection.dart';
import '../../domain/models/cart_data_model.dart';
import '../../domain/models/cart_model.dart';
import '../../domain/usecase/get_cart_data_usecase.dart';

class CartController extends GetxController with Helpers {
  AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();
  GetCartDataUseCase getCartDataUseCase = sl<GetCartDataUseCase>();
  late CartModel products;
  int isLoading = 0;

  @override
  void onInit() async {
    super.onInit();

    isLoading = 1;
    update();

    getCartData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getCartData() async {
    (await getCartDataUseCase.execute()).fold((l) {
      isLoading = 2;
      print(l);
    }, (r) {
      isLoading = 0;
      products = r;
    });
    update();
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    try {
      bool val = await appRemoteDataSource.addOrRemoveCart(context, productId: products.data[productIndex].productId);
      products.data.remove(products.data[productIndex]);
    } on AddToCartFailure {
      showSnackBar(context: context, message: ManagerStrings.failedAddToCart, error: true);
    }
    update();
  }

  void increaseQty(CartDataModel item) {
    item.productQty++;
    update();
  }

  void decreaseQty(CartDataModel item) {
    if (item.productQty > 1) {
      item.productQty--;
    }
    update();
  }
}