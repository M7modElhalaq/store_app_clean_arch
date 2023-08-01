import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store_app/core/layouts/style.dart';
import 'package:store_app/core/strings/routes.dart';
import 'package:store_app/core/widgets/custom_widget.dart';
import 'package:store_app/core/widgets/loading_widget.dart';
import 'package:store_app/core/widgets/navigator_push_name_widget.dart';
import 'package:store_app/core/widgets/welcome_back_widget.dart';
import 'package:store_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:store_app/features/auth/presentation/bloc/login/login_state.dart';
import 'package:store_app/features/auth/presentation/views/complete_profile_view.dart';

import '../../../../core/strings/strings.dart';
import '../../../../core/widgets/alert_dialog_widget.dart';
import '../../../../core/widgets/text_button_widget.dart';
import '../widgets/rich_text_widget.dart';

class OtpView extends StatelessWidget {
  final String phoneNumber;
  final bool isRegistered;
  final String verificationId;
  String? otpCode;

  OtpView({
    Key? key,
    required this.phoneNumber,
    required this.isRegistered,
    required this.verificationId,
    this.otpCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return Scaffold(
            body: LoadingWidget(),
          );
        } else if (state is VerifyPhoneNumberSuccessState) {
          return WelcomeBackWidget();
        } else {
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
                        image: AssetImage("assets/images/otp_image.png"),
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
                    numberOfFields: 6,
                    fillColor: backgroundColor,
                    enabledBorderColor: defaultAppColor,
                    filled: true,
                    onSubmit: (code) {
                      otpCode = code;
                    },
                  ),
                  SizedBoxWidget(higth: 48),
                  textButtonWidget(
                    buttonWidth: double.infinity,
                    onPressed: () {
                      print('isRegistered: $isRegistered');
                      if(otpCode != null) {
                        BlocProvider.of<LoginBloc>(context).codeVerify(
                          context,
                          verificationId: verificationId,
                          smsCode: otpCode!,
                          // smsCode: otpCode!,
                          isRegistered: isRegistered,
                          phoneNumber: int.parse(phoneNumber),
                        );
                      }
                    },
                    text: OTP_BUTTON_TEXT,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
