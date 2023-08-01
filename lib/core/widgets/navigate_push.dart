import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/otp_view.dart';

Future<dynamic> navigatePushWidget(context, {required MaterialPageRoute materialPageRoute}) {
  return Navigator.push(
    context,
    materialPageRoute,
  );
}