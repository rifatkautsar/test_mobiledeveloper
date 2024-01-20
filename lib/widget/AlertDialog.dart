import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class CustomAlertDialog {
  static void showConfirmationDialog(BuildContext context, String content, Function btnOnPress) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            backgroundColor: Colors.white,
            title: const CustomTextColor(
                color: Colors.black, text: 'Konfirmasi', size: 20),
            content:  CustomTextColor(
                color: Colors.black,
                text: content,
                size: 15),
            actions: [
              TextButton(
                onPressed: () {
                  btnOnPress();
                },
                child:
                    const CustomTextColor(color: Colors.black, text: 'Ya', size: 15),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const CustomTextColor(color: Colors.black, text: 'Tidak', size: 15),
              ),
            ],
          ),
        );
      },
    );
  }
}
