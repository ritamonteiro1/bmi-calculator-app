import 'package:calculator/domain/model/user/email_status.dart';
import 'package:calculator/domain/model/user/password_status.dart';
import 'package:calculator/domain/model/user/user_model.dart';
import 'package:calculator/domain/use_case/validate_email_use_case..dart';
import 'package:calculator/domain/use_case/validate_password_use_case.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore(
    this.validateEmailUseCase,
    this.validatePasswordUseCase,
  );

  final ValidateEmailUseCase validateEmailUseCase;
  final ValidatePasswordUseCase validatePasswordUseCase;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool loading = false;

  @action
  void setUser(UserModel userModel) {
    email = userModel.email;
    password = userModel.password;
  }

  @computed
  EmailStatus get isEmailValid => validateEmailUseCase.validateEmail(email);

  @computed
  PasswordStatus get isPasswordValid =>
      validatePasswordUseCase.validatePassword(password);

  @computed
  bool get isFormValid =>
      isEmailValid == EmailStatus.valid &&
      isPasswordValid == PasswordStatus.valid;

  @action
  void doLogin() {
    loading = true;
  }
}
