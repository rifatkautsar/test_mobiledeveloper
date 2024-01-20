import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final TextInputType? textInputType;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool? obscureText;
  final bool? withBorder;
  final void Function(String?)? onChanged;

  const CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.textInputType,
      this.readOnly = false,
      this.icon,
      this.obscureText = false,
      this.onTap,
      this.withBorder = true,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly!,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
      obscureText: obscureText!,
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
        border: withBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )
            : null,
      ),
      validator: validator,
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
