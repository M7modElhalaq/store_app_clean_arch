import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/features/sub_category_products/domain/usecase/get_sub_category_products_usecase.dart';

import '../../../../config/dependancy_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/storage/remote/data_source/app_remote_data_source.dart';
import '../../domain/model/sub_category_products_model.dart';

class SubCategoryController extends GetxController with Helpers {
  late AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();
  CacheData cacheData = CacheData();
  late SubCategoryModel subCategoryModel;
  final GetSubCategoryProductsUseCase _useCase = sl<GetSubCategoryProductsUseCase>();
  int isLoading = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;

  void onInit() async {
    super.onInit();

    isLoading = 1;
    update();

    await getSubCategoryData();

    isLoading = 0;
    update();
  }

  Future<void> getSubCategoryData() async {
    BuildContext context = Get.context as BuildContext;
    int subCategoryId = cacheData.getSubCategoryId();
    (await _useCase.execute(subCategoryId)).fold(
          (l) {
        errorMessage = l.message.toString();
        isLoading = 2;
        showDialog(
          context: context,
          builder: (context) {
            return SizedBox(
              width: ManagerWidth.w120,
              height: ManagerHeights.h100,
              child: Center(
                child: Text(l.message.toString()),
              ),
            );
          },
        );
      },
          (r) {
        subCategoryModel = r;
      },
    );
  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    try {
      bool val = await appRemoteDataSource.addOrRemoveFavorite(context,
          productId: subCategoryModel.data[productIndex].id);
      getSubCategoryData();
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
      bool val = await appRemoteDataSource.addOrRemoveCart(context, productId: subCategoryModel.data[productIndex].id);
      subCategoryModel.data.remove(subCategoryModel.data[productIndex]);
    } on AddToCartFailure {
      showSnackBar(context: context, message: ManagerStrings.failedAddToCart, error: true);
    }
    update();
  }
}