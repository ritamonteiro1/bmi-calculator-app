import '../../domain/model/bmi/bmi.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/user/user_model.dart';

class CalculatorController {
  final bmi = ValueNotifier<Bmi>(Bmi.noInformationYet);

  void resetBmi() {
    bmi.value = Bmi.noInformationYet;
  }
}
