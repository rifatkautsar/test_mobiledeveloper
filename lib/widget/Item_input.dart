import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/custom_text_field.dart';

class ItemInput extends StatelessWidget {
  final String text;
  final double textSize;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final TextInputType? textInputType;
  final IconData? icon;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;

  const ItemInput(
      {super.key,
      required this.text,
      required this.textSize,
      this.hintText,
      this.controller,
      this.textInputType,
      this.readOnly = false,
      this.icon,
      this.onTap,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextBlack(text: text, size: textSize),
        const SizedBox(height: 5),
        CustomTextField(
          hintText: hintText,
          controller: controller,
          textInputType: textInputType,
          readOnly: readOnly,
          icon: icon,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
        )
      ],
    );
  }
}
