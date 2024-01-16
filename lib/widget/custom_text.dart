import 'package:flutter/material.dart';

class CustomTextColor extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final FontWeight? fontWeight;

  const CustomTextColor(
      {super.key, required this.color, required this.text, required this.size, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

class CustomTextBlack extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? fontWeight;

  const CustomTextBlack({super.key, required this.text, required this.size, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
