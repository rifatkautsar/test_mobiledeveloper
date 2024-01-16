import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class CustomButtonRectangleBorder extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final Function btnOnPress;
  final double btnRadius;

  const CustomButtonRectangleBorder(
      {super.key,
      required this.btnColor,
      required this.btnText,
      required this.btnOnPress,
      required this.btnRadius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        btnOnPress();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius),
        ),
      ),
      child: CustomTextColor(color: Colors.white, text: btnText, size: 16),
    );
  }
}

class CustomButtonOutlined extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final Function btnOnPress;
  final double btnRadius;

  const CustomButtonOutlined(
      {super.key,
      required this.btnColor,
      required this.btnText,
      required this.btnOnPress,
      required this.btnRadius});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
       btnOnPress();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnRadius),
          ),
        ),
      ),
      child: CustomTextColor(color: btnColor, text: btnText, size: 15),
    );
  }
}
