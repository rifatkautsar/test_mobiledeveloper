import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/constant_text.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 10),
                  Text('Back'),
                ],
              ),
              SizedBox(height: 20),
              CustomTextBlack(
                text: 'Reset Password',
                size: 18,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              CustomTextColor(
                  color: Colors.grey,
                  text: ConstantText.descriptionForgotPassword,
                  size: 14),
              SizedBox(height: 20),
              ItemInput(text: 'Email Address', textSize: 14),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: CustomButtonRectangleBorder(
                    btnColor: ColorConstant.blueColor,
                    btnText: 'Kirim',
                    btnOnPress: () {},
                    btnRadius: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
