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

  String? _email;

  String? _password;

  @observable
  EmailStatus emailStatus = EmailStatus.initialState;

  @observable
  PasswordStatus passwordStatus = PasswordStatus.initialState;

  @observable
  bool loading = false;

  @action
  void setEmail(String? newEmail) {
    _email = newEmail;
    _isEmailValid();
  }

  @action
  void setPassword(String? newPassword) {
    _password = newPassword;
    _isPasswordValid();
  }

  @computed
  bool get isFormValid =>
      emailStatus == EmailStatus.valid &&
      passwordStatus == PasswordStatus.valid;

  @observable
  bool loggedIn = false;

  @action
  Future<void> doLogin() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 3));
    loading = false;
    loggedIn = true;
  }

  @action
  void logOut() {
    loggedIn = false;
  }

  void _isEmailValid() {
    emailStatus = validateEmailUseCase.validateEmail(_email);
  }

  void _isPasswordValid() {
    passwordStatus = validatePasswordUseCase.validatePassword(_password);
  }
}
