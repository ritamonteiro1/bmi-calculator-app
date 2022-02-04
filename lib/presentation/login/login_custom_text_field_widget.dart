import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';

class LoginCustomTextFieldWidget extends StatelessWidget {
  const LoginCustomTextFieldWidget({
    required this.labelText,
    required this.textInputTyped,
    required this.prefixIcon,
    required this.errorText,
    required this.onChanged,
    required this.enable,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final bool obscureText;
  final TextInputType textInputTyped;
  final Widget prefixIcon;
  final String? errorText;
  final void Function(String) onChanged;
  final bool enable;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        onChanged: onChanged,
        enabled: enable,
        keyboardType: textInputTyped,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: ConstantColors.colorTextHintForm,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      );
}
