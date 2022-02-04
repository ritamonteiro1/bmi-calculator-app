import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../constants/constant_images.dart';
import '../../domain/model/bmi/bmi.dart';
import '../../domain/model/user/user_model.dart';
import '../../domain/use_case/calculate_bmi_use_case.dart';
import '../../generated/l10n.dart';
import '../common/custom_elevated_button_widget.dart';
import 'calculator_bmi_result_widget.dart';
import 'calculator_store.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({
    required this.calculatorStore,
    required this.userModel,
    Key? key,
  }) : super(key: key);
  final CalculatorStore calculatorStore;
  final UserModel userModel;

  static Widget create(BuildContext context, UserModel userModel) =>
      ProxyProvider<CalculateBmiUseCase, CalculatorStore>(
        update: (context, calculateBmiUseCase, calculatorStore) =>
            calculatorStore ??
            CalculatorStore(
              calculateBmiUseCase,
            ),
        child: Consumer<CalculatorStore>(
          builder: (context, calculatorStore, _) => CalculatorScreen(
              calculatorStore: calculatorStore, userModel: userModel),
        ),
      );

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
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
                    widget.calculatorStore.resetBmi();
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
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    S.of(context).calculatorScreenTextHello +
                        widget.userModel.email,
                    textAlign: TextAlign.center,
                  ),
                ),
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
                  child: Observer(
                    builder: (context) => CustomElevatedButtonWidget(
                      onPressed: () {
                        widget.userModel.height =
                            double.parse(heightController.text);
                        widget.userModel.weight =
                            double.parse(weightController.text);
                        widget.calculatorStore.calculateBmi(widget.userModel);
                      },
                      colorButton: Theme.of(context).primaryColor,
                      buttonWidget: widget.calculatorStore.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(S
                              .of(context)
                              .calculatorScreenCalculateTextButton),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (context) {
                    final bmi = widget.calculatorStore.userBmi;
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
