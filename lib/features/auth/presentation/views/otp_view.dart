import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store_app/core/layouts/style.dart';
import 'package:store_app/core/widgets/custom_widget.dart';

import '../../../../core/strings/strings.dart';
import '../widgets/rich_text_widget.dart';

class OtpView extends StatelessWidget {
  final String phoneNumber;
  const OtpView({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios),
              //replace with our own icon data.
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/otp_image.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBoxWidget(higth: 24),
            RichTextWidget(
              text: OTP_TEXT1,
              textChildren: <TextSpan>[
                TextSpan(
                  text: phoneNumber,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColorBlack,
                  ),
                ),
                const TextSpan(
                  text: OTP_TEXT2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: defaultAppColor,
                  ),
                ),
              ],
            ),
            SizedBoxWidget(higth: 48),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 4,
              fillColor: backgroundColor,
              enabledBorderColor: defaultAppColor,
              filled: true,
              onSubmit: (code) => print("OTP is => $code"),
            ),
            SizedBoxWidget(higth: 48),
            TextButtonWidget(
              buttonWidth: double.infinity,
              onPressed: () {
                // Navigator.pushNamed(context, Routes.OTP_VIEW);
              },
              text: OTP_BUTTON_TEXT,
            ),
          ],
        ),
      ),
    );
  }
}
