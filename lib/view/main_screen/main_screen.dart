import 'package:calculator/constants/constant_images.dart';
import 'package:calculator/controller/main_controller.dart';
import 'package:calculator/domain/bmi.dart';
import 'package:calculator/domain/user.dart';
import 'package:calculator/view/main_screen/widgets/bmi_result_widget.dart';
import 'package:calculator/view/shared/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

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
          title: const Text('Calculadora IMC'),
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
                    decoration: const InputDecoration(
                      hintText: 'Peso (Kg)',
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    decoration: const InputDecoration(
                      hintText: 'Altura (cm)',
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
                    textButton: 'Calcular',
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
                        return const TextBmiResultWidget(
                            text: 'Você está abaixo do peso');
                      case Bmi.idealWeight:
                        return const TextBmiResultWidget(
                            text: 'Você está no peso ideal');
                      case Bmi.slightlyOverweight:
                        return const TextBmiResultWidget(
                            text: 'Você está levemente acima do peso');
                      case Bmi.obesityLevelI:
                        return const TextBmiResultWidget(
                            text: 'Você está com obesidade grau I');
                      case Bmi.obesityLevelII:
                        return const TextBmiResultWidget(
                            text: 'Você está com obesidade grau II');
                      case Bmi.obesityLevelIII:
                        return const TextBmiResultWidget(
                            text: 'Você está com obesidade grau III');
                      case Bmi.noInformationYet:
                        return const TextBmiResultWidget(
                            text: 'Digite o peso e a altura');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
