import '../model/bmi/bmi.dart';
import '../model/user/user_model.dart';

class CalculateBmi {
  static const _maximumBmiIndexForUnderWeight = 18.6;
  static const _maximumBmiIndexForIdealWeight = 24.9;
  static const _maximumBmiIndexForSlightlyOverweight = 29.9;
  static const _maximumBmiIndexForObesityLevelI = 34.9;
  static const _maximumBmiIndexForObesityLevelII = 39.9;

  Bmi calculateBMI(UserModel user) {
    final bmiResult = user.weight / (user.height * user.height);

    if (bmiResult < _maximumBmiIndexForUnderWeight) {
      return Bmi.underWeight;
    } else if (bmiResult >= _maximumBmiIndexForUnderWeight &&
        bmiResult < _maximumBmiIndexForIdealWeight) {
      return Bmi.idealWeight;
    } else if (bmiResult >= _maximumBmiIndexForIdealWeight &&
        bmiResult < _maximumBmiIndexForSlightlyOverweight) {
      return Bmi.slightlyOverweight;
    } else if (bmiResult >= _maximumBmiIndexForSlightlyOverweight &&
        bmiResult < _maximumBmiIndexForObesityLevelI) {
      return Bmi.obesityLevelI;
    } else if (bmiResult >= _maximumBmiIndexForObesityLevelI &&
        bmiResult < _maximumBmiIndexForObesityLevelII) {
      return Bmi.obesityLevelII;
    } else {
      return Bmi.obesityLevelIII;
    }
  }
}
