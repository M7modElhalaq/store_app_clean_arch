import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/features/shopping_bag/domain/model/shopping_bag_model.dart';
import 'package:store_app/features/shopping_bag/domain/use_cases/get_shopping_bag_data_use_case.dart';

import '../../../../config/dependancy_injection.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/widgets/helpers.dart';
import '../../domain/model/shopping_bag_data_orders_model.dart';

class ShoppingBagController extends GetxController with Helpers, StateMixin {
  final GetShoppingBagDataUseCase _useCase = sl<GetShoppingBagDataUseCase>();
  late ShoppingBagModel products;
  late List<ShoppingBagDataOrdersModel> orders;
  int isLoading = 0;
  int pageIndex = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;

  @override
  void onInit() async {
    super.onInit();

    isLoading = 0;
    update();

    await getShoppingBagData();

    isLoading = 1;
    update();
  }

  Future<void> getShoppingBagData() async {
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
        products = r;
        orders = products.data.onProgress;
      },
    );
    update();
  }

  void changePageIndex(int index) {
    pageIndex = index;
    switch (index) {
      case 0:
        orders = products.data.onProgress;
      case 1:
        orders = products.data.onDeliver;
      case 2:
        orders = products.data.done;
      case 3:
        orders = products.data.canceled;
      default:
        orders = products.data.onProgress;
    }
    update();
  }
}
