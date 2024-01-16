import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class AppBarCustom extends StatelessWidget {
  final String menuName;

  const AppBarCustom({super.key, required this.menuName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorConstant.blueColor,
        title: CustomTextColor(
          color: Colors.white,
          text: menuName,
          size: 15,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
