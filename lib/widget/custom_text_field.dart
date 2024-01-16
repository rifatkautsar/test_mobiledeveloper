import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      required this.obscureText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                )
              : null,
        ),
        validator: validator,
      ),
    );
  }
}

class CustomTextFieldBorder extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFieldBorder(
      {super.key, this.hintText, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
