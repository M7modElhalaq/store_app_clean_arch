import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

class ProductsTypesBar extends StatefulWidget {

  ProductsTypesBar({super.key});

  @override
  State<ProductsTypesBar> createState() => _ProductsTypesBarState();
}

class _ProductsTypesBarState extends State<ProductsTypesBar> {
  int _productTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeights.h50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r20),
        border: Border.all(
          color: ManagerColors.borderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 90,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: _productTypeIndex == 0
                  ? ManagerColors.primaryColor
                  : ManagerColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _productTypeIndex = 0;
                });
              },
              child: baseText(
                name: 'العروض',
                color: _productTypeIndex == 0
                    ? ManagerColors.white
                    : ManagerColors.textColor,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 90,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: _productTypeIndex == 1
                  ? ManagerColors.primaryColor
                  : ManagerColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _productTypeIndex = 1;
                });
              },
              child: baseText(
                name: 'الأكثر مبيعا',
                color: _productTypeIndex == 1
                    ? ManagerColors.white
                    : ManagerColors.textColor,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 90,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: _productTypeIndex == 2
                  ? ManagerColors.primaryColor
                  : ManagerColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _productTypeIndex = 2;
                });
              },
              child: baseText(
                name: 'وصل حديثا',
                color: _productTypeIndex == 2
                    ? ManagerColors.white
                    : ManagerColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
