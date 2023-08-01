import 'package:flutter/material.dart';

Future<Object?> navigatePushNameWidget({required BuildContext context, required String route}) {
  return Navigator.pushNamed(context, route);
}
