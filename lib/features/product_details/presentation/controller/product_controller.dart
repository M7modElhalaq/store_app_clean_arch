import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/cache/cache.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';
import 'package:store_app/features/product_details/domain/model/product_details_model.dart';
import 'package:store_app/features/product_details/domain/usecase/product_details_usecase.dart';

import '../../../../config/dependancy_injection.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/widgets/page_view_indicator.dart';

class ProductController extends GetxController {
  late AppSettingsSharedPreferences appSettingsSharedPreferences;
  late AppRemoteDataSource appRemoteDataSource;
  late PageController pageController;
  CacheData cacheData = CacheData();
  ProductDetailsUseCase productDetailsUseCase = sl<ProductDetailsUseCase>();
  int isLoading = 0;
  int qty = 1;
  int currentPageIndex = 0;
  int productId = 0;
  late ProductDetailsModel product;
  String errorMessage = ManagerStrings.somethingWentWrong;
  List sizes = [];
  int selectedColor = -1;
  int selectedSize = -1;

  @override
  void onInit() async {
    super.onInit();
    appSettingsSharedPreferences = AppSettingsSharedPreferences();
    appRemoteDataSource = AppRemoteDataSource();
    pageController = PageController(initialPage: 0);

    isLoading = 1;
    await getProductDetails();
    isLoading = 2;
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> getProductDetails() async {
    productId = cacheData.getProductId();
    BuildContext context = Get.context!;
    (await productDetailsUseCase.execute(productId)).fold((l) {
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
    }, (r) {
      product = r;
      print(r);
    });
  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    product.data.inFavorites = !product.data.inFavorites;
    await appRemoteDataSource.addOrRemoveFavorite(context,
        productId: productIndex);
    update();
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    await appRemoteDataSource.addOrRemoveCart(context, productId: productIndex);
    update();
  }

  void increaseQty() {
    if (qty < product.data.productQty) {
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
    selectedColor = index;
    update();
  }

  void addOrDeleteFromSelectedSizes(int index) {
    selectedSize = index;
    update();
  }

  void onPageSliderImageChanged(int index) {
    currentPageIndex = index;
  }

  List<Widget> imagesList() {
    List<Widget> children = <Widget>[];

    for(int i=0; i<product.data.multiImg.length ; i++) {
      children.add(Image.network(
        product.data.multiImg[i],
        fit: BoxFit.fill,
      ));
    }

    if (children.isEmpty) {
      children.add(Image.network(
        product.data.productThumbnail,
        fit: BoxFit.fill,
      ));
    }
    return children;
  }

  List<Widget> imagesIndicator() {
    List<Widget> children = <Widget>[];

    for(int i=0; i<product.data.multiImg.length ; i++) {
      children.add(
        PageViewIndicator(
          selected:
          currentPageIndex == i,
          color: Colors.white,
          elseColor:
          Colors.white.withOpacity(0.6),
        ),
      );
      children.add(
        SizedBox(
          width: ManagerWidth.w8,
        ),
      );
    }

    return children;
  }
}
