import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatefulWidget {
  const CustomElevatedButtonWidget({
    required this.onPressed,
    required this.textButton,
    required this.colorButton,
    Key? key,
  }) : super(key: key);
  final Function onPressed;
  final String textButton;
  final Color colorButton;

  @override
  State<CustomElevatedButtonWidget> createState() =>
      _CustomElevatedButtonWidgetState();
}

class _CustomElevatedButtonWidgetState
    extends State<CustomElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: widget.colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(widget.textButton),
      );
}
