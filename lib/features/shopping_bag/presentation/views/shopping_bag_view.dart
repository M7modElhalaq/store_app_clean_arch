import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/shimmer/shimmer_shopping_bag_page.dart';
import 'package:store_app/features/shopping_bag/presentation/controller/shopping_bag_controller.dart';

class ShoppingBagView extends StatelessWidget {
  const ShoppingBagView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingBagController>(
      builder: (controller) {
        return controller.isLoading == 0 ?
            const ShimmerShoppingBagPageList() :
          Scaffold(
            appBar: AppBar(
              title: Center(child: Text(ManagerStrings.shoppingBagTitle),),
            ),
          body: controller.isLoading == 2 ?
          Center(
            child: Text(controller.errorMessage),
          ): Column(
            children: [
              Center(child: Text('Shopping Bag')),
            ],
          )
        );
      }
    );
  }
}
