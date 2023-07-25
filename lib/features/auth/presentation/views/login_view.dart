import 'package:flutter/material.dart';

import '../../../../core/strings/strings.dart';
import '../../../../core/widgets/custom_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Login Text
            TextWidget(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            SizedBoxWidget(
              higth: 24,
            ),
            // Text form field

            // Login Button

            // Policy
          ],
        ),
      ),
    );
  }
}
