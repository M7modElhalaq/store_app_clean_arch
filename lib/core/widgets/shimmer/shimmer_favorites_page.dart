import 'package:flutter/material.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/widgets/shimmer/shimmer_container.dart';

class ShimmerFavoritesPageList extends StatelessWidget {
  const ShimmerFavoritesPageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            itemCount: Constance.shimmerFavoritesItemCounts,
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
        ],
      ),
    );
  }
}
