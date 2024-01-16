import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class CustomAlertDialog {
  static void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: ColorConstant.blueColor,
          title: CustomTextColor(
              color: Colors.white, text: 'Konfirmasi', size: 20),
          content: CustomTextColor(
              color: Colors.white,
              text: 'Apakah anda yakin ingin menghapus data ini?',
              size: 15),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child:
                  CustomTextColor(color: Colors.white, text: 'Ya', size: 15),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: CustomTextColor(color: Colors.white, text: 'Tidak', size: 15),
            ),
          ],
        );
      },
    );
  }
}
