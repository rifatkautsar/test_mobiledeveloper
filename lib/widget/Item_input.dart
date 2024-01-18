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
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextBlack(text: text, size: textSize),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: readOnly!,
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: MediaQuery.of(context).size.height < 600
                ? const EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                : const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            hintText: hintText,
            suffixIcon: icon != null
                ? IconButton(
                    onPressed: onTap,
                    icon: Icon(icon),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          validator: validator,
        )
      ],
    );
  }
}
