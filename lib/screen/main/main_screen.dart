import 'package:calculator/constants/constant_images.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String information = 'Informe seus dados';

  void resetFields() {
    heightController.clear();
    weightController.clear();
  }

  void calculateBMI() {
    final height = double.parse(heightController.text) / 100;
    final weight = double.parse(weightController.text);

    final bmi = weight / (height * height);

    if (bmi < 18.6) {
      information = 'Você está abaixo do peso (${bmi.toStringAsPrecision(2)})';
    } else if (bmi >= 18.6 && bmi < 24.9) {
      information = 'Você está no peso ideal (${bmi.toStringAsPrecision(2)})';
    } else if (bmi >= 18.6 && bmi < 24.9) {
      information =
          'Você está levemente acima do peso (${bmi.toStringAsPrecision(2)})';
    } else if (bmi >= 24.9 && bmi < 34.9) {
      information =
          'Você está com obesidade grau I (${bmi.toStringAsPrecision(2)})';
    } else if (bmi >= 34.9 && bmi < 39.9) {
      information =
          'Você está com obesidade grau II (${bmi.toStringAsPrecision(2)})';
    } else {
      information =
          'Você está com obesidade grau III (${bmi.toStringAsPrecision(2)})';
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora IMC"),
          backgroundColor: Theme.of(context).primaryColor,
          leading: Image.asset(ConstantImages.logoIoasys),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                  onTap: resetFields, child: const Icon(Icons.refresh)),
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
                    controller: heightController,
                    decoration: const InputDecoration(
                      hintText: 'Altura (cm)',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 33.5),
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(calculateBMI);
                    },
                    child: Text('Calcular'),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  information,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      );
}
