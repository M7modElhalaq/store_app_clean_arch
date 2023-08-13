import 'package:flutter/material.dart';

VerticalDivider verticalDivider({
  double? thickness,
  Color? color,
}) {
  return VerticalDivider(
    thickness: thickness ?? 0.15,
    indent: 0,
    endIndent: 0,
    color: color ?? Colors.grey,
  );
}