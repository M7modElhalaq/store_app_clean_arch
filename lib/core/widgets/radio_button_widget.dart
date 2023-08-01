import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:store_app/core/resources/manager_font_sizes.dart';
import 'package:store_app/core/widgets/base_text_widget.dart';

import '../resources/manager_colors.dart';

Widget radioButton(
    {String? text, String? value, String? groupValue, required Icon icon, required void Function(String?)? onChanged,}) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: RadioListTile(
            title: baseText(name: text ?? '', color: ManagerColors.grey,),
            value: value ?? '',
            groupValue: groupValue ?? '',
            onChanged: onChanged,
          ),
        ),
        icon,
      ],
    ),
  );
}
