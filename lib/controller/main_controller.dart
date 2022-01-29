import 'package:calculator/domain/bmi.dart';
import 'package:calculator/domain/user.dart';
import 'package:flutter/cupertino.dart';

class MainController {
  final bmi = ValueNotifier<Bmi>(Bmi.noInformationYet);
  static const _maximumBmiIndexForUnderWeight = 18.6;
  static const _maximumBmiIndexForIdealWeight = 24.9;
  static const _maximumBmiIndexForSlightlyOverweight = 29.9;
  static const _maximumBmiIndexForObesityLevelI = 34.9;
  static const _maximumBmiIndexForObesityLevelII = 39.9;

  void calculateBMI(User user) {
    final bmiResult = user.weight / (user.height * user.height);

    if (bmiResult < _maximumBmiIndexForUnderWeight) {
      bmi.value = Bmi.underWeight;
    } else if (bmiResult >= _maximumBmiIndexForUnderWeight &&
        bmiResult < _maximumBmiIndexForIdealWeight) {
      bmi.value = Bmi.idealWeight;
    } else if (bmiResult >= _maximumBmiIndexForIdealWeight &&
        bmiResult < _maximumBmiIndexForSlightlyOverweight) {
      bmi.value = Bmi.slightlyOverweight;
    } else if (bmiResult >= _maximumBmiIndexForSlightlyOverweight &&
        bmiResult < _maximumBmiIndexForObesityLevelI) {
      bmi.value = Bmi.obesityLevelI;
    } else if (bmiResult >= _maximumBmiIndexForObesityLevelI &&
        bmiResult < _maximumBmiIndexForObesityLevelII) {
      bmi.value = Bmi.obesityLevelII;
    } else {
      bmi.value = Bmi.obesityLevelIII;
    }
  }

  void resetBmi() {
    bmi.value = Bmi.noInformationYet;
  }
}
