import 'package:flutter/material.dart';

import '../layouts/style.dart';

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
