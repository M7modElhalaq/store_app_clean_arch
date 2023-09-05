import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';
import 'package:store_app/config/dependancy_injection.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/core/widgets/page_view_indicator.dart';
import 'package:store_app/features/favourites/presentation/controller/favorites_controller.dart';
import 'package:store_app/features/home/domain/use_cases/get_home_data_usecase.dart';
import 'package:store_app/routes/routes.dart';

import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/widgets/base_text_widget.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
import '../../domain/model/home_model.dart';
import '../../domain/model/products_model.dart';
import '../../domain/model/sub_category_model.dart';

class HomeController extends GetxController with Helpers, StateMixin {
  final GetHomeDataUseCase _useCase = sl<GetHomeDataUseCase>();
  CacheData cacheData = CacheData();
  var favoritesController = Get.find<FavoritesController>();
  var cartController = Get.find<CartController>();
  List<ProductsModel>? products;
  late int productTypeIndex;
  late AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();
  late TextEditingController searchController =
      searchController = TextEditingController();
  late PageController pageController = PageController(initialPage: initialPage);
  int initialPage = 0;
  int isLoading = 0;
  int sliderIndex = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;

  late HomeModel homeModel;

  List<ScreenHiddenDrawer> itens = [];

  @override
  void onInit() async {
    super.onInit();
    productTypeIndex = 0;
    sliderIndex = 0;

    await getHomeData();
  }

  @override
  void onClose() {
    productTypeIndex = 0;
    isLoading = 0;
    pageController.dispose();
    print('Close Home');
    super.onClose();
  }

  Future<void> getHomeData() async {
    isLoading = 0;
    update();
    BuildContext context = Get.context as BuildContext;
    (await _useCase.execute()).fold(
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
        homeModel = r;
        products = homeModel.data.products.offerProducts;
        isLoading = 1;
      },
    );
    update();
  }

  void changeProductsBar(BuildContext context, int index) {
    productTypeIndex = index;
    if (index == 0) {
      products = homeModel.data.products.offerProducts;
    } else if (index == 1) {
      products = homeModel.data.products.topProducts;
    } else if (index == 2) {
      products = homeModel.data.products.latestProducts;
    }
    update();
  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    try {
      products![productIndex].inFavorites =
          !(products![productIndex].inFavorites);
      bool val = await appRemoteDataSource.addOrRemoveFavorite(context,
          productId: products![productIndex].id);
      favoritesController.getFavoritesDetails();
      if (!val) {
        products?[productIndex].inFavorites = false;
      }
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
      bool val = await appRemoteDataSource.addOrRemoveCart(context,
          productId: productIndex);
      cartController.getCartData();
      update();
      if (!val) {
        products?[productIndex].inCart = false;
      }
    } on AddToCartFailure {
      showSnackBar(
          context: context,
          message: ManagerStrings.failedAddToCart,
          error: true);
    }
    update();
  }

  void changeSlider(int index) {
    sliderIndex = index;
    update();
  }

  List<Widget> slider() {
    List<Widget> children = <Widget>[];
    for (int i = 0; i < homeModel.data.sliders.length; i++) {
      Widget widget = Image.network(
        homeModel.data.sliders[i].image,
        fit: BoxFit.fill,
      );
      children.add(widget);
    }
    return children;
  }

  List<Widget> sliderIndicator() {
    List<Widget> children = <Widget>[];
    for (int i = 0; i < homeModel.data.sliders.length; i++) {
      Widget widget = PageViewIndicator(
        selected: sliderIndex == i,
        color: Colors.white,
        elseColor: Colors.white.withOpacity(0.6),
      );
      Widget sizeBox = SizedBox(
        width: ManagerWidth.w8,
      );
      children.add(widget);
      children.add(sizeBox);
    }
    return children;
  }

  List<Widget> sliderContent() {
    List<Widget> children = <Widget>[];

    for (int i = 0; i < homeModel.data.categories.length; i++) {
      if (homeModel.data.categories[i].subCategory.length > 0) {
        Widget widget = ExpansionTile(
          title: baseText(
            name: homeModel.data.categories[i].nameAr,
            color: ManagerColors.white,
            fontWeight: ManagerFontWeight.bold,
          ),
          trailing: HeroIcon(
            HeroIcons.chevronDown,
            color: ManagerColors.white.withOpacity(.6),
          ),
          children: addSubCategory(homeModel.data.categories[i].subCategory),
        );
        children.add(widget);
      }
      else {
        Widget widget = ListTile(
          title: baseText(
            name: homeModel.data.categories[i].nameAr,
            color: ManagerColors.white,
            fontSize: ManagerFontSizes.s14,
          ),
          onTap: () {
            //action on press
          },
        );
        children.add(widget);
      }
    }
    return children;
  }

  List<Widget> addSubCategory(List<SubCategoryModel> subCategory) {
    BuildContext context = Get.context!;
    List<Widget> children = <Widget>[];
    for (int j = 0; j < subCategory.length; j++) {
      Widget widget = ListTile(
        title: baseText(
          name: subCategory[j].nameAr,
          color: ManagerColors.white,
          fontSize: ManagerFontSizes.s14,
        ),
        onTap: () {
          cacheData.setSubCategoryId(subCategory[j].id);
          Navigator.pushReplacementNamed(context, Routes.subCategoryView);
        },
      );
      children.add(widget);
    }
    return children;
  }

  void productDetails(context, int productId) {
    cacheData.setProductId(productId);
    Navigator.pushReplacementNamed(context, Routes.productView);
  }
}
