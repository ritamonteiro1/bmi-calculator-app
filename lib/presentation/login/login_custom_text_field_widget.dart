import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';

class LoginCustomTextFieldWidget extends StatefulWidget {
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
  State<LoginCustomTextFieldWidget> createState() =>
      _LoginCustomTextFieldWidgetState();
}

class _LoginCustomTextFieldWidgetState
    extends State<LoginCustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) => TextFormField(
        onChanged: widget.onChanged,
        keyboardType: widget.textInputTyped,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          errorText: widget.errorText,
          errorStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: ConstantColors.colorTextHintForm,
          ),
          prefixIcon: widget.prefixIcon,
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
