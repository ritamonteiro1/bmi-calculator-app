import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    required this.buttonWidget,
    required this.colorButton,
    this.onPressed,
    Key? key,
  }) : super(key: key);
  final Function()? onPressed;
  final Widget buttonWidget;
  final Color colorButton;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: buttonWidget,
      );
}
