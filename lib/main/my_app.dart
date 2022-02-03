import '../presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../constants/constant_colors.dart';
import '../constants/constant_fonts.dart';
import '../constants/constant_routes.dart';
import '../generated/l10n.dart';
import '../presentation/calculator/calculator_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: ConstantColors.primaryColor,
            fontFamily: ConstantFonts.poppinsRegular),
        initialRoute: '/',
        routes: {
          ConstantRoutes.homeScreenRouteName: (context) => const LoginScreen(),
          ConstantRoutes.mainScreenRouteName: (context) =>
              const CalculatorScreen(),
        },
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      );
}
