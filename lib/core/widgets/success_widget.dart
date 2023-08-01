import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/navigate_push.dart';
import 'package:store_app/core/widgets/text_button_widget.dart';
import 'package:store_app/features/main_app/presentation/views/main_app_view.dart';

class successWidget extends StatelessWidget {
  const successWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ManagerMargin.h24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(ManagerAssets.celebrationImage),
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 48),
            baseText(
              name: ManagerStrings.congrats,
              color: Colors.green,
              fontSize: ManagerFontSizes.s30,
            ),
            const SizedBox(height: 12),
            baseText(
              name: ManagerStrings.greatJob,
              fontSize: ManagerFontSizes.s26,
            ),
            const SizedBox(height: 12),
            baseText(
              name: ManagerStrings.dataSaved,
              fontSize: ManagerFontSizes.s26,
            ),
            const SizedBox(height: 48),
            textButtonWidget(
              onPressed: () {
                navigatePushWidget(
                  context,
                  materialPageRoute: MaterialPageRoute(
                    builder: (context) => MainAppView(),
                  ),
                );
              },
              text: ManagerStrings.mainPage,
            ),
          ],
        ),
      ),
    );
  }
}
