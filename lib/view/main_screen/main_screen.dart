import 'package:flutter/material.dart';

import '../../constants/constant_images.dart';
import '../../controller/main_controller.dart';
import '../../domain/bmi.dart';
import '../../domain/user.dart';
import '../../generated/l10n.dart';
import '../shared/custom_elevated_button_widget.dart';
import 'widgets/bmi_result_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainController mainController = MainController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).mainScreenAppBarTitle),
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
                      hintText:
                          (S.of(context).mainScreenWeightTextField).toString(),
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
                      hintText: S.of(context).mainScreenHeightTextField,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 33.5),
                  width: 300,
                  height: 50,
                  child: CustomElevatedButtonWidget(
                    function: () {
                      final user = User(
                        double.parse(heightController.text),
                        double.parse(weightController.text),
                      );
                      mainController.calculateBMI(user);
                    },
                    colorButton: Theme.of(context).primaryColor,
                    textButton: S.of(context).mainScreenTextButton,
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
                        return TextBmiResultWidget(
                            text: S
                                .of(context)
                                .mainScreenTextBmiResultUnderWeight);
                      case Bmi.idealWeight:
                        return TextBmiResultWidget(
                            text: S
                                .of(context)
                                .mainScreenTextBmiResultIdealWeight);
                      case Bmi.slightlyOverweight:
                        return TextBmiResultWidget(
                            text: S
                                .of(context)
                                .mainScreenTextBmiResultSlightlyOverweight);
                      case Bmi.obesityLevelI:
                        return TextBmiResultWidget(
                            text: S
                                .of(context)
                                .mainScreenTextBmiResultObesityLevelI);
                      case Bmi.obesityLevelII:
                        return TextBmiResultWidget(
                            text: S
                                .of(context)
                                .mainScreenTextBmiResultObesityLevelII);
                      case Bmi.obesityLevelIII:
                        return TextBmiResultWidget(
                            text: S
                                .of(context)
                                .mainScreenTextBmiResultObesityLevelIII);
                      case Bmi.noInformationYet:
                        return TextBmiResultWidget(
                            text: S
                                .of(context)
                                .mainScreenTextBmiResultNoInformationYet);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
