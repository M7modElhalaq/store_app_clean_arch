import 'package:flutter/material.dart';

import '../layouts/style.dart';
import '../strings/strings.dart';

Widget TextWidget({
  required String text,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  Color color = textColorBlack,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Widget SizedBoxWidget({double higth = 0, double width = 0}) {
  return SizedBox(
    height: higth,
    width: width,
  );
}

Widget TextButtonWidget({
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
