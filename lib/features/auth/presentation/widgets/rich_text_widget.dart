import 'package:flutter/material.dart';
import 'package:store_app/core/layouts/style.dart';

class RichTextWidget extends StatelessWidget {
  final String text;
  final List<TextSpan> textChildren;
  const RichTextWidget({Key? key, required this.textChildren, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.clip,
      textAlign: TextAlign.start,
      softWrap: true,
      maxLines: 2,
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16,
          color: textColorBlack,
        ),
        children: textChildren,
      ),
    );
  }
}
