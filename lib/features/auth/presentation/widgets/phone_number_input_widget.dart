import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInputWidget extends StatefulWidget{
  final TextEditingController controller;

  PhoneNumberInputWidget({super.key, required this.controller});

  @override
  State<PhoneNumberInputWidget> createState() => _PhoneNumberInputWidgetState();
}

class _PhoneNumberInputWidgetState extends State<PhoneNumberInputWidget> {
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InternationalPhoneNumberInput(
        hintText: '05XXXXXXXXX',
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          // print(value);
        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: widget.controller,
        formatInput: true,
        keyboardType: TextInputType.numberWithOptions(
            signed: true, decimal: true),
        inputBorder: UnderlineInputBorder(),
      ),
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