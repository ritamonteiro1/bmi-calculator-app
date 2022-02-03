import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';

class LoginCustomTextFieldWidget extends StatelessWidget {
  const LoginCustomTextFieldWidget({
    required this.labelText,
    required this.controller,
    required this.textInputTyped,
    required this.prefixIcon,
    required this.validator,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputTyped;
  final Widget prefixIcon;
  final String? Function(String? typedField) validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: textInputTyped,
        obscureText: obscureText,
        validator: (typedField) {
          validator(typedField);
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: ConstantColors.colorTextHintForm,
          ),
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      );
}
