import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';

class LoginCustomTextFieldWidget extends StatelessWidget {
  const LoginCustomTextFieldWidget({
    required this.hintText,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) => TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ConstantColors.colorTextHintForm,
          ),
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