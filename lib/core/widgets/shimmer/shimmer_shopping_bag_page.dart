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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: ManagerHeights.h30,
            ),
            ShimmerContainer(
              height: ManagerHeights.h80,
            ),
            ShimmerContainer(
              height: ManagerHeights.h100,
            ),
            ListView.builder(
              itemCount: Constance.shimmerShoppingBagItemCounts,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ShimmerContainer(
                  height: ManagerHeights.h100,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
