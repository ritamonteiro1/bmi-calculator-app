import '../di/setup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../constants/constant_colors.dart';
import '../constants/constant_fonts.dart';
import '../generated/l10n.dart';
import '../presentation/login/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: ConstantColors.primaryColor,
              fontFamily: ConstantFonts.poppinsRegular),
          home: const LoginScreen(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      );
}
