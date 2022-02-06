import 'package:calculator/constants/constant_routes.dart';
import 'package:calculator/domain/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../constants/constant_images.dart';
import '../../domain/model/user/email_status.dart';
import '../../domain/model/user/password_status.dart';
import '../../domain/use_case/validate_email_use_case..dart';
import '../../domain/use_case/validate_password_use_case.dart';
import '../../generated/l10n.dart';
import '../common/custom_elevated_button_widget.dart';
import 'login_custom_text_field_widget.dart';
import 'login_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    required this.loginStore,
    Key? key,
  }) : super(key: key);
  final LoginStore loginStore;

  static Widget create(BuildContext context) =>
      ProxyProvider2<ValidateEmailUseCase, ValidatePasswordUseCase, LoginStore>(
        update: (context, validateEmailUseCase, validatePasswordUseCase,
                loginStore) =>
            loginStore ??
            LoginStore(
              validateEmailUseCase,
              validatePasswordUseCase,
            ),
        child: Consumer<LoginStore>(
          builder: (context, loginStore, _) => LoginScreen(
            loginStore: loginStore,
          ),
        ),
      );

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => widget.loginStore.loggedIn, (loggedIn) {
      final userModel = UserModel(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
      if (loggedIn != null && loggedIn == true) {
        Navigator.of(context).pushNamed(
          ConstantRoutes.calculatorScreenRouteName,
          arguments: userModel,
        );
      }
    });
  }

  @override
  void dispose() {
    disposer();
    widget.loginStore.logOut();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Image.asset(ConstantImages.logoHomeIoasys),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                S.of(context).loginScreenWelcomeText,
                style: const TextStyle(
                  fontSize: 31,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                S.of(context).loginScreenCalculatorText,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Observer(
                  builder: (_) => LoginCustomTextFieldWidget(
                    controller: emailTextEditingController,
                    onChanged: widget.loginStore.setEmail,
                    labelText:
                        (S.of(context).loginScreenUserTextHint).toString(),
                    textInputTyped: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    errorText: _isEmailValid(),
                    enable: !widget.loginStore.loading,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Observer(
                  builder: (_) => LoginCustomTextFieldWidget(
                    controller: passwordTextEditingController,
                    onChanged: widget.loginStore.setPassword,
                    labelText:
                        (S.of(context).loginScreenPasswordTextHint).toString(),
                    textInputTyped: TextInputType.number,
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: widget.loginStore.passwordVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        widget.loginStore.togglePasswordVisibility();
                      },
                    ),
                    obscureText: !widget.loginStore.passwordVisible,
                    errorText: _isPasswordValid(),
                    enable: !widget.loginStore.loading,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: Observer(
                  builder: (context) => CustomElevatedButtonWidget(
                    colorButton: Colors.black,
                    onPressed: widget.loginStore.isFormValid
                        ? widget.loginStore.doLogin
                        : null,
                    buttonWidget: widget.loginStore.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            (S.of(context).loginScreenSignInTextButton)
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));

  String? _isEmailValid() {
    final isEmailValid = widget.loginStore.emailStatus;
    switch (isEmailValid) {
      case EmailStatus.valid:
        return null;
      case EmailStatus.invalid:
        return S.of(context).loginScreenFormInvalidEmail;
      case EmailStatus.empty:
        return S.of(context).loginScreenEmptyFormText;
      case EmailStatus.initialState:
        return null;
    }
  }

  String? _isPasswordValid() {
    final isPasswordValid = widget.loginStore.passwordStatus;
    switch (isPasswordValid) {
      case PasswordStatus.valid:
        return null;
      case PasswordStatus.invalid:
        return S.of(context).loginScreenFormInvalidPassword;
      case PasswordStatus.empty:
        return S.of(context).loginScreenEmptyFormText;
      case PasswordStatus.initialState:
        return null;
    }
  }
}
