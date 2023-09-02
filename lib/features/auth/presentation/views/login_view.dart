import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/widgets/custom_widget.dart';
import 'package:store_app/core/widgets/text_button_widget.dart';
import 'package:store_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_clip_path_widget.dart';
import 'package:store_app/features/auth/presentation/widgets/rich_text_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (controller) {
          String? phoneNumber;
          return Stack(
            children: [
              const CustomClipPathWidget(),
              Container(
                margin: const EdgeInsets.only(top: 150, right: 24, left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Login Text
                    TextWidget(
                      text: ManagerStrings.login,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    SizedBoxWidget(
                      higth: 24,
                    ),
                    // Text form field
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: ManagerStrings.phoneNumber),
                              InternationalPhoneNumberInput(
                                textAlign: TextAlign.end,
                                hintText: ManagerStrings.loginHintText,
                                onInputChanged: (PhoneNumber number) {
                                  print(number.isoCode);
                                  phoneNumber = number.phoneNumber;
                                },
                                onInputValidated: (bool value) {
                                  // print(value);
                                },
                                selectorConfig: const SelectorConfig(
                                  selectorType:
                                  PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                const TextStyle(color: Colors.black),
                                initialValue: controller.number,
                                textFieldController: controller.controller,
                                formatInput: true,
                                keyboardType:
                                const TextInputType.numberWithOptions(
                                    signed: true, decimal: true,),
                                inputBorder: const UnderlineInputBorder(),
                              ),
                            ],
                          ),
                          // Login Button
                          SizedBoxWidget(
                            higth: 55,
                          ),
                          textButtonWidget(
                              buttonWidth: double.infinity,
                              text: ManagerStrings.loginButton,
                              onPressed: () {
                                // print('Form Validate: ${controller.text}');
                                controller.signInWithPhone(
                                  context,
                                  phoneNumber!,
                                );
                              }),
                        ],
                      ),
                    ),
                    // Policy
                    SizedBoxWidget(
                      higth: 70,
                    ),
                    RichTextWidget(
                      text: ManagerStrings.loginViewText1,
                      textChildren: <TextSpan>[
                        TextSpan(
                          text: ManagerStrings.loginViewText2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ManagerStrings.loginViewText3,
                          style: TextStyle(
                            color: ManagerColors.black,
                          ),
                        ),
                      ],
                    ),
                    // Top Clip Path
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
