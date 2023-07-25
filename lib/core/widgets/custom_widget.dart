import 'package:flutter/material.dart';

import '../layouts/style.dart';
import '../strings/strings.dart';

Widget TextWidget({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  Color color = textColorBlack,
}) {
  return Text(
    LOGIN_TEXT,
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
