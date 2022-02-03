import 'package:flutter/material.dart';

class CalculatorTextBmiResultWidget extends StatelessWidget {
  const CalculatorTextBmiResultWidget({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          fontSize: 18,
        ),
      );
}
