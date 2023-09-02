import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';

class PageViewIndicator extends StatelessWidget {
  final bool selected;
  final double marginEnd;
  final Color color;
  final Color elseColor;

  const PageViewIndicator({
    Key? key,
    required this.selected,
    this.marginEnd = 0,
    this.color = Colors.black,
    this.elseColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidth.w6,
      height: ManagerHeights.h6,
      margin: EdgeInsets.only(right: marginEnd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        color: selected ? color : elseColor,
      ),
    );
  }
}
