import 'package:calculator/domain/model/bmi/bmi.dart';
import 'package:calculator/domain/model/user/user_model.dart';
import 'package:calculator/domain/use_case/calculate_bmi_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CalculateBmiUseCase calculateBmiUseCase;
  setUpAll(() {
    calculateBmiUseCase = CalculateBmiUseCase();
  });
  group('GIVEN a call on calculateBMI', () {
    test(
        'WHEN height = 170cm and height = 60kg '
        'THEN it should return an Bmi.idealWeight', () async {
      final user = UserModel(email: 'email@email.com', password: '123456');
      user.height = 170.00;
      user.weight = 60.00;
      final bmi = calculateBmiUseCase.calculateBMI(user);
      expect(bmi, Bmi.idealWeight);
    });
  });
}
