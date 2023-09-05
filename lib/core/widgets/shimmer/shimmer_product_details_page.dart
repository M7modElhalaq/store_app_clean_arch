import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/widgets/shimmer/shimmer_container.dart';

class ShimmerProductDetailsPageList extends StatelessWidget {
  const ShimmerProductDetailsPageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: ManagerHeights.h30,),
            ShimmerContainer(
              height: ManagerHeights.h260,
              horizontalMargin: 0,
            ),
            ShimmerContainer(
              height: ManagerHeights.h60,
              horizontalMargin: 0,
            ),
            ShimmerContainer(
              height: ManagerHeights.h80,
              horizontalMargin: 0,
            ),
            ShimmerContainer(
              height: ManagerHeights.h80,
              horizontalMargin: 0,
            ),
            ShimmerContainer(
              height: ManagerHeights.h80,
              horizontalMargin: 0,
            ),
            ShimmerContainer(
              height: ManagerHeights.h160,
              horizontalMargin: 0,
            ),
            ShimmerContainer(
              height: ManagerHeights.h60,
              horizontalMargin: 0,
            ),
          ],
        ),
      ),
    );
  }
}
