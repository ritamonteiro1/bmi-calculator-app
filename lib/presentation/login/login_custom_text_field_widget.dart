import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';

class LoginCustomTextFieldWidget extends StatelessWidget {
  const LoginCustomTextFieldWidget({
    required this.hintText,
    required this.controller,
    required this.textInputTyped,
    required this.prefixIcon,
    required this.validator,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputTyped;
  final Widget prefixIcon;
  final void Function(String? typedField) validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: textInputTyped,
        obscureText: obscureText,
        validator: (typedField) {
          validator(typedField);
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ConstantColors.colorTextHintForm,
          ),
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      );
}
