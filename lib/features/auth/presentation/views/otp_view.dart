import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:store_app/core/layouts/style.dart';
import 'package:store_app/core/resources/manager_assets.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/custom_widget.dart';
import 'package:store_app/features/auth/presentation/controller/auth_controller.dart';
import '../../../../core/widgets/text_button_widget.dart';
import '../widgets/rich_text_widget.dart';

class OtpView extends StatelessWidget {
  final String phoneNumber;
  final bool isRegistered;
  final String verificationId;

  OtpView({
    Key? key,
    required this.phoneNumber,
    required this.isRegistered,
    required this.verificationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
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
                      image: AssetImage(ManagerAssets.otpImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBoxWidget(higth: 24),
                RichTextWidget(
                  text: ManagerStrings.otpText1,
                  textChildren: <TextSpan>[
                    TextSpan(
                      text: phoneNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColorBlack,
                      ),
                    ),
                    TextSpan(
                      text: ManagerStrings.otpText2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: defaultAppColor,
                      ),
                    ),
                  ],
                ),
                SizedBoxWidget(higth: 48),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  fillColor: backgroundColor,
                  enabledBorderColor: defaultAppColor,
                  filled: true,
                  onSubmit: (code) {
                    controller.otpCode = code;
                  },
                ),
                SizedBoxWidget(higth: 48),
                textButtonWidget(
                  buttonWidth: double.infinity,
                  onPressed: () {
                    print(controller.otpCode);
                    if(controller.otpCode != null) {
                      controller.codeVerify(
                        context,
                        verificationId: verificationId,
                        smsCode: controller.otpCode!,
                        isRegistered: isRegistered,
                        phoneNumber: int.parse(phoneNumber),
                      );
                    }
                  },
                  text: ManagerStrings.otpButtonText,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
