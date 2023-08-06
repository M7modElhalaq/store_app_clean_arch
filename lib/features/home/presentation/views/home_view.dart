import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_padding.dart';
import 'package:store_app/core/resources/manager_radius.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/features/home/presentation/views/widgets/progress_indicator.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/widgets/profile_text_form_field_widget.dart';
import '../../../../core/widgets/vertical_divider_widget.dart';
import 'widgets/slider_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();
  late PageController _pageController;
  int _initialPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w20,
          vertical: ManagerHeights.h12,
        ),
        child: Column(
          children: [
            // Search Text Field
            TextFormField(
              style: TextStyle(
                color: ManagerColors.black,
              ),
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: HeroIcon(
                  HeroIcons.magnifyingGlass,
                  color: ManagerColors.iconsColor,
                ),
                hintText: ManagerStrings.searchHint,
                hintStyle: TextStyle(
                  color: ManagerColors.grey,
                  fontSize: ManagerFontSizes.s14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ManagerColors.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ManagerColors.borderColor),
                  borderRadius: BorderRadius.circular(ManagerRadius.r30),
                ),
              ),
            ),
            const SizedBox(
              height: ManagerHeights.h24,
            ),
            // Slider
            Container(
              height: ManagerHeights.h150,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: const [
                  SliderWidget(index: 0,),
                  SliderWidget(index: 1,),
                  SliderWidget(index: 2,),
                  SliderWidget(index: 3,),
                ],
              ),
            ),
            // Products App Bar

            // Products
          ],
        ),
      ),
    );
  }
}
