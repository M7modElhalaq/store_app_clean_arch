import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget alertDialogWidget(BuildContext context) {
  return Scaffold(
    body: AlertDialog(
      title: Text("حدث خطأ ما"),
      content: Text('يرجي كتابة كود التحقق مرة اخري'),
      actions: [
        TextButton(
          child: Text("حسنا"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}