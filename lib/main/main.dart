import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../domain/model/user/user_model.dart';
import '../presentation/calculator/calculator_screen.dart';
import '../presentation/login/login_screen.dart';
import 'my_app.dart';

void main() {
  FluroRouter.appRouter
    ..define(
      '/',
      handler: Handler(
        handlerFunc: (context, params) => LoginScreen.create(context!),
      ),
    )
    ..define(
      '/calculator',
      handler: Handler(handlerFunc: (context, params) {
        final userModel = context!.settings!.arguments as UserModel;
        return CalculatorScreen.create(context, userModel);
      }),
    );

  runApp(MyApp());
}
