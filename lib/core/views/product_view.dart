import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_fonts.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/product_color_widget.dart';
import 'package:store_app/core/widgets/product_size_widget.dart';
import 'package:store_app/core/widgets/text_button_widget.dart';
import 'package:store_app/features/home/domain/entities/product.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int qty = 1;
  late Product product;
  List sizes = [];
  List<int> selectedColors = [];
  List<int> selectedSizes = [];

  @override
  Widget build(BuildContext context) {
    ModalRoute modalRoute = ModalRoute.of(context)!;
    if (modalRoute != null &&
        modalRoute.settings != null &&
        modalRoute.settings.arguments != null) {
      Map<String, dynamic> args =
          modalRoute.settings.arguments as Map<String, dynamic>;
      product = args['product'];
      sizes = product.productSize.split(',');
    }
    return Scaffold(
      appBar: AppBar(
        elevation: Constance.appBarElevation,
        backgroundColor: ManagerColors.white,
        actions: [
          IconButton(
            icon: const HeroIcon(HeroIcons.heart),
            onPressed: () {},
          ),
          IconButton(
            icon: const HeroIcon(HeroIcons.shoppingBag),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: ManagerHeights.h280,
              color: ManagerColors.productImageBackgroundColor,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: ManagerMargin.h48, vertical: ManagerMargin.v24),
                child: Image.asset(ManagerAssets.productImage),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: const EdgeInsets.all(ManagerMargin.h24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        baseText(
                          name: product.productNameAr,
                          fontWeight: ManagerFontWeight.bold,
                          fontSize: ManagerFontSizes.s24,
                          color: ManagerColors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: ManagerMargin.v8,
                          ),
                          child: Row(
                            children: [
                              baseText(
                                name: '\$${product.sellingPrice}',
                                decoration: TextDecoration.lineThrough,
                                fontWeight: ManagerFontWeight.bold,
                                color: ManagerColors.grey,
                                visible: product.discount != 0 ? true : false,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              baseText(
                                name: product.discount != 0
                                    ? "\$${(product.sellingPrice - (product.sellingPrice * product.discount) / 100).round()}"
                                    : "\$${product.sellingPrice}",
                                fontSize: ManagerFontSizes.s18,
                                fontWeight: ManagerFontWeight.bold,
                                color: ManagerColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: ManagerHeights.h12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: ManagerColors.borderColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          baseText(
                            name: product.brandAr,
                            color: ManagerColors.grey,
                            fontWeight: ManagerFontWeight.bold,
                          ),
                          if (int.parse(product.productQty) > 1) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (qty > 1) {
                                        qty--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: ManagerWidth.w24,
                                    height: ManagerHeights.h24,
                                    decoration: BoxDecoration(
                                      color: qty == 1
                                          ? ManagerColors.primaryColor
                                              .withOpacity(.5)
                                          : ManagerColors.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r8),
                                    ),
                                    alignment: Alignment.center,
                                    child: baseText(
                                      name: '-',
                                      color: ManagerColors.white,
                                      fontWeight: ManagerFontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: ManagerWidth.w8),
                                  child: baseText(
                                    name: '$qty',
                                    color: ManagerColors.black,
                                    fontSize: ManagerFontSizes.s20,
                                    fontWeight: ManagerFontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(qty < int.parse(product.productQty)) {
                                        qty++;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: ManagerWidth.w24,
                                    height: ManagerHeights.h24,
                                    decoration: BoxDecoration(
                                      color: ManagerColors.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r8),
                                    ),
                                    alignment: Alignment.center,
                                    child: baseText(
                                      name: '+',
                                      color: ManagerColors.white,
                                      fontWeight: ManagerFontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ] else ...[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: ManagerWidth.w8),
                              child: baseText(
                                name: ManagerStrings.noQty,
                                color: ManagerColors.black,
                                fontSize: ManagerFontSizes.s20,
                                fontWeight: ManagerFontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: ManagerHeights.h16,
                    ),
                    baseText(
                      name: ManagerStrings.colors,
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontSizes.s16,
                      color: ManagerColors.black,
                    ),
                    const SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    Container(
                      height: ManagerHeights.h60,
                      padding: const EdgeInsets.symmetric(
                        vertical: ManagerMargin.v12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: ManagerColors.borderColor,
                          ),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: product.colors.isNotEmpty
                            ? product.colors.length
                            : 1,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (product.colors.isNotEmpty) {
                            final buffer = StringBuffer();
                            buffer.write('ff');
                            buffer.write(
                            product.colors[index].replaceFirst('#', ''));
                            return ProductColorWidget(
                              color: int.parse(buffer.toString(), radix: 16),
                              isSelected: selectedColors.contains(index),
                              onTap: () {
                                setState(() {
                                  if (selectedColors.contains(index)) {
                                    selectedColors.remove(index);
                                  } else {
                                    selectedColors.add(index);
                                  }
                                });
                              },
                            );
                          } else {
                            return baseText(
                              name: ManagerStrings.noColors,
                              color: ManagerColors.black,
                              fontWeight: ManagerFontWeight.regular,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: ManagerHeights.h16,
                    ),
                    baseText(
                      name: ManagerStrings.sizes,
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontSizes.s16,
                      color: ManagerColors.black,
                    ),
                    const SizedBox(
                      height: ManagerHeights.h12,
                    ),
                    Container(
                      height: ManagerHeights.h60,
                      padding: const EdgeInsets.symmetric(
                        vertical: ManagerMargin.v12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: ManagerColors.borderColor,
                          ),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: sizes.isNotEmpty ? sizes.length - 1 : 1,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (sizes.isNotEmpty) {
                            return ProductSizeWidget(
                              size: sizes[index],
                              isSelected: selectedSizes.contains(index),
                              onTap: () {
                              setState(() {
                                if(selectedSizes.contains(index)){
                                  selectedSizes.remove(index);
                                } else {
                                  selectedSizes.add(index);
                                }
                              });
                            },
                            );
                          } else {
                            return baseText(
                              name: ManagerStrings.noSizes,
                              color: ManagerColors.black,
                              fontWeight: ManagerFontWeight.bold,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: ManagerHeights.h16,
                    ),
                    baseText(
                      name: ManagerStrings.description,
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontSizes.s16,
                      color: ManagerColors.black,
                    ),
                    const SizedBox(height: ManagerHeights.h12),
                    Container(
                      width: double.infinity,
                      child: Text(
                        product.descriptionAr,
                        style: TextStyle(
                          color: ManagerColors.grey,
                          fontFamily: ManagerFont.appFont,
                          fontWeight: ManagerFontWeight.w400,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                    const SizedBox(height: ManagerHeights.h24),
                    textButtonWidget(
                      text: ManagerStrings.pay,
                      isVisible: int.parse(product.productQty) > 1,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
