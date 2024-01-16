import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/forgot_password_page.dart';
import 'package:test_mobiledeveloper/screens/nav_drawer.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextBlack(
                  text: 'Login',
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Icon(Icons.alternate_email),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                          hintText: 'Email ID', obscureText: false),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                          hintText: 'Password', obscureText: true),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordPage()));
                    },
                    child: CustomTextColor(
                        color: ColorConstant.blueColor,
                        text: 'Forgot Password?',
                        size: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: CustomButtonRectangleBorder(
                        btnColor: ColorConstant.blueColor,
                        btnText: 'Login',
                        btnOnPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavDrawer()),
                          );
                        }, btnRadius: 25,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
