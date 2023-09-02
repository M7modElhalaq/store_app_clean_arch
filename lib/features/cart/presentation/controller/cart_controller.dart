import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/features/cart/domain/entities/cart_model.dart';
import 'package:store_app/features/cart/domain/use_cases/get_cart_data.dart';

class CartController extends GetxController with Helpers {
  AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();
  final GetCartUseCase getProducts;
  CartModel? products;

  CartController({required this.getProducts});

  @override
  void onInit() async {
    super.onInit();
    print('ProductLoadingState');
    final cart = await getProducts();
    cart.fold(
          (failure) {
        products = null;
      },
          (r) {
        products = r;
      },
    );
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    try {
      products!.data[productIndex].product!.inFavorites = !(products!.data[productIndex].product!.inFavorites);
      bool val = await appRemoteDataSource.addOrRemoveFavorite(context, productId: products!.data[productIndex].id);
      if(!val) {
        products!.data[productIndex].product!.inFavorites = false;
      }
    } on AddToFavFailure {
      showSnackBar(context: context, message: ManagerStrings.failedAddToFav, error: true);
    }
    update();
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    try {
      products!.data[productIndex].product!.inCart = !(products!.data[productIndex].product!.inCart);
      bool val = await appRemoteDataSource.addOrRemoveCart(context, productId: products!.data[productIndex].id);
      if(!val) {
        products!.data[productIndex].product!.inCart = false;
      }
    } on AddToCartFailure {
      showSnackBar(context: context, message: ManagerStrings.failedAddToCart, error: true);
    }
    update();
  }
}