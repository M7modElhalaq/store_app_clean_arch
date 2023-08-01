import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/text_button_widget.dart';

import '../../features/main_app/presentation/views/main_app_view.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_font_sizes.dart';
import '../resources/manager_margin.dart';
import '../strings/manager_strings.dart';
import 'base_text_widget.dart';
import 'navigate_push.dart';

class WelcomeBackWidget extends StatefulWidget {
  const WelcomeBackWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeBackWidget> createState() => _WelcomeBackWidgetState();
}

class _WelcomeBackWidgetState extends State<WelcomeBackWidget> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      navigatePushWidget(
        context,
        materialPageRoute: MaterialPageRoute(
          builder: (context) => MainAppView(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: ManagerMargin.h24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(ManagerAssets.celebrationImage),
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 48),
              baseText(
                name: ManagerStrings.welcomeMessage,
                fontSize: ManagerFontSizes.s26,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              baseText(
                name: ManagerStrings.redirectMessage,
                fontSize: ManagerFontSizes.s26,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
