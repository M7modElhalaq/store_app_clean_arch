import 'package:flutter/material.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/widgets/shimmer/shimmer_container.dart';

class ShimmerShoppingBagPageList extends StatelessWidget {
  const ShimmerShoppingBagPageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShimmerContainer(
            height: ManagerHeights.h60,
          ),
          GridView.builder(
            itemCount: Constance.shimmerShoppingBagItemCounts,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ShimmerContainer();
            }, gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 180,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          ),
        ],
      ),
    );
  }
}
