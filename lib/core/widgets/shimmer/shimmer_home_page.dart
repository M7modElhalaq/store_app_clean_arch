import 'package:flutter/material.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/widgets/shimmer/shimmer_container.dart';

class ShimmerResourceList extends StatelessWidget {
  const ShimmerResourceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShimmerContainer(
            height: ManagerHeights.h70,
          ),
          ShimmerContainer(
            height: ManagerHeights.h150,
          ),
          ShimmerContainer(
            height: ManagerHeights.h70,
          ),
          GridView.builder(
            itemCount: Constance.shimmerItemCounts,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ShimmerContainer(
              );
            }, gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 180,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          ),
          ShimmerContainer(
            height: ManagerHeights.h80,
          ),
        ],
      ),
    );
  }
}
