import 'package:flutter/material.dart';

class TextBmiResultWidget extends StatelessWidget {
  const TextBmiResultWidget({
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
