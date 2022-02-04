import 'package:mobx/mobx.dart';

import '../../domain/model/user/email_status.dart';
import '../../domain/model/user/password_status.dart';
import '../../domain/use_case/validate_email_use_case..dart';
import '../../domain/use_case/validate_password_use_case.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore(
    this.validateEmailUseCase,
    this.validatePasswordUseCase,
  );

  final ValidateEmailUseCase validateEmailUseCase;
  final ValidatePasswordUseCase validatePasswordUseCase;

  String? email;

  @observable
  EmailStatus? emailStatus;

  @observable
  String? password;

  @observable
  bool loading = false;

  @action
  void setEmail(String? newEmail) {
    email = newEmail;
    _isEmailValid();
  }

  @action
  void setPassword(String? newPassword) => password = newPassword;

  void _isEmailValid() {
    emailStatus = validateEmailUseCase.validateEmail(email);
  }

  PasswordStatus isPasswordValid() =>
      validatePasswordUseCase.validatePassword(password);

  // @computed
  // bool get isFormValid =>
  //     isEmailValid == EmailStatus.valid &&
  //     isPasswordValid == PasswordStatus.valid;

  @action
  void doLogin() {
    loading = true;
  }
}
