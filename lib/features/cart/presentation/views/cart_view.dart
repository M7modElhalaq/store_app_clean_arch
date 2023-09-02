import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/features/cart/presentation/controller/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartController>(
        builder: (controller) {
          return const Center(
            child: Text('CartView'),
          );
        },
      ),
    );
  }
}
