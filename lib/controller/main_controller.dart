import 'package:calculator/domain/bmi.dart';
import 'package:calculator/domain/user.dart';
import 'package:flutter/cupertino.dart';

class MainController {
  final bmi = ValueNotifier<Bmi>(Bmi.noInformationYet);

  void calculateBMI(User user) {
    final bmiResult = user.weight / (user.height * user.height);

    if (bmiResult < 18.6) {
      bmi.value = Bmi.underWeight;
    } else if (bmiResult >= 18.6 && bmiResult < 24.9) {
      bmi.value = Bmi.idealWeight;
    } else if (bmiResult >= 18.6 && bmiResult < 24.9) {
      bmi.value = Bmi.slightlyOverweight;
    } else if (bmiResult >= 24.9 && bmiResult < 34.9) {
      bmi.value = Bmi.obesityLevelI;
    } else if (bmiResult >= 34.9 && bmiResult < 39.9) {
      bmi.value = Bmi.obesityLevelII;
    } else {
      bmi.value = Bmi.obesityLevelIII;
    }
  }

  void resetBmi() {
    bmi.value = Bmi.noInformationYet;
  }
}
