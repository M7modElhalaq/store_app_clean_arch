import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/layouts/style.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/resources/manager_font_weight.dart';
import 'package:store_app/core/resources/manager_height.dart';
import 'package:store_app/core/resources/manager_icon_sizes.dart';
import 'package:store_app/core/resources/manager_margin.dart';
import 'package:store_app/core/resources/manager_width.dart';
import 'package:store_app/core/strings/manager_strings.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';
import 'package:store_app/core/widgets/failed_widget.dart';
import 'package:store_app/core/widgets/loading_widget.dart';
import 'package:store_app/core/widgets/profile_text_form_field_widget.dart';
import 'package:store_app/core/widgets/radio_button_widget.dart';
import 'package:store_app/core/widgets/success_widget.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_radius.dart';
import '../../../../core/widgets/alert_dialog_widget.dart';
import '../../../../core/widgets/text_button_widget.dart';
import '../../../../core/widgets/vertical_divider_widget.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_state.dart';

class CompleteProfileView extends StatefulWidget {
  final int phoneNumber;
  CompleteProfileView({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dayOfBirthController = TextEditingController();

  String gender = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
        builder: (context, state) {
          if(state is LoginLoadingState) {
            return Scaffold(
              body: LoadingWidget(),
            );
          } else if(state is RegisterAccountSuccessState) {
            return Scaffold(
              body: successWidget(),
            );
          }
          // else if(state is RegisterAccountErrorState) {
          //   return Scaffold(
          //     body: failedWidget(),
          //   );
          // }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                child: baseText(
                  name: ManagerStrings.completeProfileAppBarTitle,
                  fontWeight: ManagerFontWeight.w600,
                ),
              ),
              backgroundColor: backgroundColor,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: ManagerMargin.h24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: ManagerRadius.r64,
                            backgroundColor: Colors.white,
                            backgroundImage:
                            AssetImage('assets/images/default_profile_image.jpg'),
                            // child: Image.network(
                            //     'https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg',
                            //
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: ManagerWidth.w35,
                              height: ManagerHeights.h35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ManagerRadius.r20)),
                                color: ManagerColors.primaryColor,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: HeroIcon(
                                  HeroIcons.camera,
                                  style: HeroIconStyle.solid,
                                  color: ManagerColors.white,
                                  size: ManagerIconSizes.s20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            baseText(
                              name: ManagerStrings.userNameLabel,
                              fontSize: ManagerFontSizes.s14,
                              fontFamily: ManagerFont.appFont,
                            ),
                            textFormField(
                              controller: userNameController,
                              hintText: ManagerStrings.hintTextUserName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ManagerStrings.usernameValidationMessage;
                                }
                                return null;
                              },
                              prefixIcon: HeroIcon(
                                HeroIcons.user,
                                style: HeroIconStyle.solid,
                                color: ManagerColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            baseText(
                              name: ManagerStrings.emailLabel,
                              fontSize: ManagerFontSizes.s14,
                              fontFamily: ManagerFont.appFont,
                            ),
                            textFormField(
                              controller: emailController,
                              hintText: ManagerStrings.hintTextEmail,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ManagerStrings.emailValidationMessage;
                                }
                                return null;
                              },
                              prefixIcon: HeroIcon(
                                HeroIcons.envelope,
                                style: HeroIconStyle.solid,
                                color: ManagerColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            baseText(
                              name: ManagerStrings.idNumberLabel,
                              fontSize: ManagerFontSizes.s14,
                              fontFamily: ManagerFont.appFont,
                            ),
                            textFormField(
                              controller: idController,
                              hintText: ManagerStrings.hintTextIdNumber,
                              prefixIcon: HeroIcon(
                                HeroIcons.identification,
                                style: HeroIconStyle.solid,
                                color: ManagerColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            baseText(
                              name: ManagerStrings.dayOfBirthLabel,
                              fontSize: ManagerFontSizes.s14,
                              fontFamily: ManagerFont.appFont,
                            ),
                            textFormField(
                              controller: dayOfBirthController,
                              hintText: ManagerStrings.hintTextDayOfBirth,
                              prefixIcon: HeroIcon(
                                HeroIcons.calendarDays,
                                style: HeroIconStyle.solid,
                                color: ManagerColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            baseText(
                              name: ManagerStrings.genderLabel,
                              fontSize: ManagerFontSizes.s14,
                              fontFamily: ManagerFont.appFont,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                shape: Border.all(
                                  width: 0.15,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color(0xFFD0D0D0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  radioButton(
                                      text: ManagerStrings.male,
                                      value: 'male',
                                      groupValue: gender,
                                      icon: Icon(
                                        Icons.male,
                                        color: ManagerColors.grey,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      }),
                                  verticalDivider(),
                                  radioButton(
                                    text: ManagerStrings.female,
                                    value: 'female',
                                    groupValue: gender,
                                    icon: Icon(
                                      Icons.female,
                                      color: ManagerColors.grey,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 36),
                            textButtonWidget(
                                buttonWidth: double.infinity,
                                text: ManagerStrings.save,
                                onPressed: () {
                                  print('Save Profile Data: ${widget.phoneNumber}');
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<LoginBloc>(context)
                                        .registerCustomer(
                                      phoneNumber: widget.phoneNumber!,
                                      profileImage: '',
                                      userName: userNameController.text,
                                      email: emailController.text,
                                      idNumber: int.parse(idController.text) ?? 0,
                                      dayOfBirth: dayOfBirthController.text,
                                      gender: gender,
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
