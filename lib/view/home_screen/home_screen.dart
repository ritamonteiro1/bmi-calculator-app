import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../constants/constant_routes.dart';
import '../../generated/l10n.dart';
import '../shared/custom_elevated_button_widget.dart';
import 'widgets/custom_text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Image.asset(ConstantImages.logoHomeIoasys),
                const Padding(
                  padding: EdgeInsets.only(top: 129),
                ),
                Text(
                  S.of(context).homeScreenWelcomeText,
                  style: const TextStyle(
                    fontSize: 31,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).homeScreenCalculatorText,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 67),
                  width: 300,
                  height: 50,
                  child: CustomTextFieldWidget(
                    hintText: (S.of(context).homeScreenUserTextHint).toString(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: CustomTextFieldWidget(
                    hintText:
                        (S.of(context).homeScreenPasswordTextHint).toString(),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: CustomElevatedButtonWidget(
                      function: () => Navigator.pushReplacementNamed(
                          context, ConstantRoutes.mainScreenRouteName),
                      textButton:
                          (S.of(context).homeScreenTextButton).toString(),
                      colorButton: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );
}
