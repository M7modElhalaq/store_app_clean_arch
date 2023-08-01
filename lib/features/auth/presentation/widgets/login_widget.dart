import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:store_app/core/layouts/style.dart';
import 'package:store_app/core/strings/strings.dart';
import 'package:store_app/core/widgets/custom_widget.dart';
import 'package:store_app/core/widgets/loading_widget.dart';
import 'package:store_app/core/widgets/navigate_push.dart';
import 'package:store_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:store_app/features/auth/presentation/bloc/login/login_state.dart';
import 'package:store_app/features/auth/presentation/widgets/rich_text_widget.dart';

import '../../../../core/widgets/text_button_widget.dart';
import '../bloc/login/login_event.dart';
import '../views/otp_view.dart';
import 'custom_clip_path_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    String? phoneNumber;
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return LoadingWidget();
        }
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
                    text: LOGIN_TEXT,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  SizedBoxWidget(
                    higth: 24,
                  ),
                  // Text form field
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextWidget(text: PHONE_NUMBER),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: InternationalPhoneNumberInput(
                                textAlign: TextAlign.end,
                                hintText: '05XXXXXXXXX',
                                onInputChanged: (PhoneNumber number) {
                                  // print(number.phoneNumber);
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
                                initialValue: number,
                                textFieldController: controller,
                                formatInput: true,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                inputBorder: const UnderlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        // Login Button
                        SizedBoxWidget(
                          higth: 55,
                        ),
                        textButtonWidget(
                            buttonWidth: double.infinity,
                            text: LOGIN_BUTTON_TEXT,
                            onPressed: () {
                              // print('Form Validate: ${controller.text}');
                              BlocProvider.of<LoginBloc>(context)
                                  .signInWithPhone(
                                context,
                                phoneNumber!,
                              );
                              // if (state is CheckCustomerAccountSuccessState) {
                              //   print('CheckCustomerAccountSuccessState');
                              //   navigatePushWidget(
                              //     context: context,
                              //     otpView: OtpView(
                              //       phoneNumber: phoneNumber!,
                              //       isRegistered: true,
                              //     ),
                              //   );
                              // } else {
                              //   print('CheckCustomerAccountError');
                              //   navigatePushWidget(
                              //     context: context,
                              //     otpView: OtpView(
                              //       phoneNumber: phoneNumber!,
                              //       isRegistered: false,
                              //     ),
                              //   );
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => OtpView(
                              //         phoneNumber: phoneNumber!,
                              //         isRegistered: false,
                              //       ),
                              //     ),
                              //   );
                              // }
                              // print('Phone Number: $phoneNumber');
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => OtpView(
                              //       phoneNumber: phoneNumber!,
                              //     ),
                              //   ),
                              // );
                            }),
                      ],
                    ),
                  ),
                  // Policy
                  SizedBoxWidget(
                    higth: 70,
                  ),
                  const RichTextWidget(
                    text: LOGIN_VIEW_TEXT1,
                    textChildren: <TextSpan>[
                      TextSpan(
                        text: LOGIN_VIEW_TEXT2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: defaultAppColor,
                        ),
                      ),
                      TextSpan(
                        text: LOGIN_VIEW_TEXT3,
                        style: TextStyle(
                          color: textColorBlack,
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
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }
}
