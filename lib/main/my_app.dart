import 'package:calculator/constants/constant_colors.dart';
import 'package:calculator/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Calculadora IMC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ConstantColors.primaryColor,
        ),
        home: const HomeScreen(),
      );
}
