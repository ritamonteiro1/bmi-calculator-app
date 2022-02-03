import '../../extensions/string_extensions.dart';
import '../model/user/password_status.dart';

class ValidatePasswordUseCase {
  final minimumPasswordLength = 6;

  PasswordStatus validatePassword(String? password) {
    if (password == null || password.isBlank()) {
      return PasswordStatus.empty;
    } else {
      if (password.length < minimumPasswordLength) {
        return PasswordStatus.invalid;
      } else {
        return PasswordStatus.valid;
      }
    }
  }
}
