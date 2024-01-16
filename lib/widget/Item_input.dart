import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/custom_text_field.dart';

class ItemInput extends StatelessWidget {
  final String text;
  final double textSize;
  const ItemInput({super.key, required this.text, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextBlack(text: text, size: textSize),
        SizedBox(height: 5),
        CustomTextFieldBorder()
      ],
    );
  }
}
