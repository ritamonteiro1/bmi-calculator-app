import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../domain/model/bmi/bmi.dart';
import '../../domain/model/user/user_model.dart';
import '../../generated/l10n.dart';
import '../common/custom_elevated_button_widget.dart';
import 'calculator_bmi_result_widget.dart';
import 'calculator_controller.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorController mainController = CalculatorController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).calculatorScreenAppBarTitle),
          backgroundColor: Theme.of(context).primaryColor,
          leading: Image.asset(ConstantImages.logoIoasys),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                  onTap: () {
                    heightController.clear();
                    weightController.clear();
                    mainController.resetBmi();
                  },
                  child: const Icon(Icons.refresh)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: Image.asset(
                    ConstantImages.imageUserProfile,
                  ),
                ),
                const SizedBox(
                  height: 47,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    decoration: InputDecoration(
                      hintText: (S.of(context).calculatorScreenWeightTextField)
                          .toString(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    decoration: InputDecoration(
                      hintText: S.of(context).calculatorScreenHeightTextField,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 33.5),
                  width: 300,
                  height: 50,
                  child: CustomElevatedButtonWidget(
                    onPressed: () {
                      // final user = UserModel(
                      //   double.parse(heightController.text),
                      //   double.parse(weightController.text),
                      // );
                      // mainController.calculateBMI(user);
                    },
                    colorButton: Theme.of(context).primaryColor,
                    buttonWidget:
                        Text(S.of(context).calculatorScreenCalculateTextButton),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder<Bmi>(
                  valueListenable: mainController.bmi,
                  builder: (context, bmi, _) {
                    switch (bmi) {
                      case Bmi.underWeight:
                        return CalculatorTextBmiResultWidget(
                            text: S
                                .of(context)
                                .calculatorScreenTextBmiResultUnderWeight);
                      case Bmi.idealWeight:
                        return CalculatorTextBmiResultWidget(
                            text: S
                                .of(context)
                                .calculatorScreenTextBmiResultIdealWeight);
                      case Bmi.slightlyOverweight:
                        return CalculatorTextBmiResultWidget(
                            text: S
                                .of(context)
                                .calculatorScreenTextBmiResultSlightlyOverweight);
                      case Bmi.obesityLevelI:
                        return CalculatorTextBmiResultWidget(
                            text: S
                                .of(context)
                                .calculatorScreenTextBmiResultObesityLevelI);
                      case Bmi.obesityLevelII:
                        return CalculatorTextBmiResultWidget(
                            text: S
                                .of(context)
                                .calculatorScreenTextBmiResultObesityLevelII);
                      case Bmi.obesityLevelIII:
                        return CalculatorTextBmiResultWidget(
                            text: S
                                .of(context)
                                .calculatorScreenTextBmiResultObesityLevelIII);
                      case Bmi.noInformationYet:
                        return CalculatorTextBmiResultWidget(
                            text: S
                                .of(context)
                                .calculatorScreenTextBmiResultNoInformationYet);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
