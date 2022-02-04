import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../constants/constant_images.dart';
import '../../domain/model/user/email_status.dart';
import '../../domain/model/user/password_status.dart';
import '../../domain/use_case/validate_email_use_case..dart';
import '../../domain/use_case/validate_password_use_case.dart';
import '../../generated/l10n.dart';
import '../calculator/calculator_screen.dart';
import '../common/custom_elevated_button_widget.dart';
import 'login_custom_text_field_widget.dart';
import 'login_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ValidateEmailUseCase validateEmailUseCase;
  late ValidatePasswordUseCase validatePasswordUseCase;
  late LoginStore loginStore;
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    validateEmailUseCase = ValidateEmailUseCase();
    validatePasswordUseCase = ValidatePasswordUseCase();
    loginStore = LoginStore(validateEmailUseCase, validatePasswordUseCase);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn != null && loggedIn == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const CalculatorScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    disposer();
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
                      onChanged: loginStore.setEmail,
                      labelText:
                          (S.of(context).loginScreenUserTextHint).toString(),
                      textInputTyped: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      errorText: _isEmailValid(),
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
                      onChanged: loginStore.setPassword,
                      labelText: (S.of(context).loginScreenPasswordTextHint)
                          .toString(),
                      textInputTyped: TextInputType.number,
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      obscureText: true,
                      errorText: _isPasswordValid(),
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
                      onPressed: () {
                        if (loginStore.isFormValid) {
                          loginStore.doLogin();
                        } else {
                          return null;
                        }
                      },
                      buttonWidget: loginStore.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              (S.of(context).loginScreenSignInTextButton)
                                  .toString(),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  String? _isEmailValid() {
    final isEmailValid = loginStore.emailStatus;
    if (isEmailValid == EmailStatus.invalid) {
      return S.of(context).loginScreenFormInvalidEmail;
    } else {
      if (isEmailValid == EmailStatus.empty) {
        return S.of(context).loginScreenEmptyFormText;
      } else {
        return null;
      }
    }
  }

  String? _isPasswordValid() {
    final isPasswordValid = loginStore.passwordStatus;
    switch (isPasswordValid) {
      case PasswordStatus.valid:
        return null;
      case PasswordStatus.invalid:
        return S.of(context).loginScreenFormInvalidPassword;
      case PasswordStatus.empty:
        return S.of(context).loginScreenEmptyFormText;
    }
  }
}
