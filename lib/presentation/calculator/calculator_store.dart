import 'package:calculator/domain/model/bmi/bmi.dart';
import 'package:calculator/domain/model/user/user_model.dart';
import 'package:calculator/domain/use_case/calculate_bmi_use_case.dart';
import 'package:mobx/mobx.dart';

part 'calculator_store.g.dart';

class CalculatorStore = _CalculatorStore with _$CalculatorStore;

abstract class _CalculatorStore with Store {
  _CalculatorStore(
    this.calculateBmiUseCase,
  );

  final CalculateBmiUseCase calculateBmiUseCase;

  @observable
  Bmi userBmi = Bmi.noInformationYet;

  @observable
  bool loading = false;

  @action
  Future<void> calculateBmi(UserModel userModel) async {
    final bmi = calculateBmiUseCase.calculateBMI(userModel);
    loading = true;
    await Future.delayed(const Duration(seconds: 2));
    userBmi = bmi;
    loading = false;
  }

  @action
  void resetBmi() {
    userBmi = Bmi.noInformationYet;
  }
}
