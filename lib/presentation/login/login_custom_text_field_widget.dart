import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';

class LoginCustomTextFieldWidget extends StatelessWidget {
  const LoginCustomTextFieldWidget({
    required this.labelText,
    required this.textInputTyped,
    required this.prefixIcon,
    required this.errorText,
    required this.onChanged,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final bool obscureText;
  final TextInputType textInputTyped;
  final Widget prefixIcon;
  final String? errorText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) => TextFormField(
        onChanged: onChanged,
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
