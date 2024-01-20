import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/login/forgot_password_page.dart';
import 'package:test_mobiledeveloper/widget/nav_drawer.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;

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
                    Icon(Icons.alternate_email, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Email ID',
                        color: Colors.grey,
                        obscureText: false,
                        withBorder: false,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Password',
                        obscureText: isPasswordVisible ? false : true,
                        icon: isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        withBorder: false,
                      ),
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
                    child: const CustomTextColor(
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
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: CustomButtonRectangleBorder(
                      btnColor: ColorConstant.blueColor,
                      btnText: 'Login',
                      btnOnPress: () {
                        Get.offAll(() => const NavDrawer());
                      },
                      btnRadius: 25,
                    ),
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
