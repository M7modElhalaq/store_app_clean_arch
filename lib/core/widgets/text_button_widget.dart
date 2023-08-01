import 'package:flutter/material.dart';

import '../layouts/style.dart';

Widget textButtonWidget({
  double buttonWidth = double.infinity,
  double buttonHeight = 60,
  double textSize = 20,
  Color textColor = textColorWhite,
  Color bgColor = defaultAppColor,
  required void Function()? onPressed,
  required String text,
}) {
  return Container(
    width: buttonWidth,
    height: buttonHeight,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: textColorWhite,
        backgroundColor: bgColor,
        padding: const EdgeInsets.all(16.0),
        textStyle: TextStyle(fontSize: textSize),
      ),
      onPressed: onPressed,
      child: Text(text),
    ),
  );
}