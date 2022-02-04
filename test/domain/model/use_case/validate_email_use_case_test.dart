import 'package:calculator/domain/model/user/email_status.dart';
import 'package:calculator/domain/use_case/validate_email_use_case..dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ValidateEmailUseCase validateEmailUseCase;
  setUpAll(() {
    validateEmailUseCase = ValidateEmailUseCase();
  });
  group('GIVEN a call on validateEmail', () {
    test('WHEN email is blank THEN it should return an EmailStatus.empty',
        () async {
      final emailStatus = validateEmailUseCase.validateEmail('');
      expect(emailStatus, EmailStatus.empty);
    });
    test('WHEN email is null THEN it should return an EmailStatus.empty',
        () async {
      final emailStatus = validateEmailUseCase.validateEmail(null);
      expect(emailStatus, EmailStatus.empty);
    });
    test('WHEN email is invalid THEN it should return an EmailStatus.invalid',
        () async {
      final emailStatus = validateEmailUseCase.validateEmail('email');
      expect(emailStatus, EmailStatus.invalid);
    });
    test('WHEN email is valid THEN it should return an EmailStatus.valid',
        () async {
      final emailStatus = validateEmailUseCase.validateEmail('email@email.com');
      expect(emailStatus, EmailStatus.valid);
    });
  });
}
