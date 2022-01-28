import 'package:calculator/constants/constant_colors.dart';
import 'package:calculator/constants/constant_fonts.dart';
import 'package:calculator/view/home_screen/home_screen.dart';
import 'package:calculator/view/main_screen/main_screen.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Calculadora IMC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: ConstantColors.primaryColor,
            fontFamily: ConstantFonts.poppinsRegular),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/main': (context) => const MainScreen(),
        },
      );
}
