import 'package:calculator/domain/model/user/email_status.dart';
import 'package:calculator/domain/model/user/password_status.dart';
import 'package:calculator/domain/model/user/user_model.dart';
import 'package:calculator/domain/use_case/validate_email_use_case..dart';
import 'package:calculator/domain/use_case/validate_password_use_case.dart';
import 'package:calculator/presentation/calculator/calculator_screen.dart';
import 'package:calculator/presentation/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../constants/constant_images.dart';
import '../../generated/l10n.dart';
import '../common/custom_elevated_button_widget.dart';
import 'login_custom_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userEmailInputController =
      TextEditingController();
  final TextEditingController _userPasswordInputController =
      TextEditingController();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
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
    disposer = reaction((_) => loginStore.isFormValid, (isFormValid) {
      if (isFormValid != null && isFormValid == true) {
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
                  padding: EdgeInsets.only(top: 129),
                ),
                Text(
                  S.of(context).loginScreenWelcomeText,
                  style: const TextStyle(
                    fontSize: 31,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).loginScreenCalculatorText,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 67),
                  width: 300,
                  height: 50,
                  child: Observer(
                    builder: (context) => Form(
                      key: _formKeyEmail,
                      child: LoginCustomTextFieldWidget(
                        labelText:
                            (S.of(context).loginScreenUserTextHint).toString(),
                        controller: _userEmailInputController,
                        textInputTyped: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        validator: (_) {
                          if (loginStore.isEmailValid == EmailStatus.invalid) {
                            return S.of(context).loginScreenFormInvalidEmail;
                          } else {
                            if (loginStore.isEmailValid == EmailStatus.empty) {
                              return S.of(context).loginScreenEmptyFormText;
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: Observer(
                    builder: (context) => Form(
                      key: _formKeyPassword,
                      child: LoginCustomTextFieldWidget(
                        labelText: (S.of(context).loginScreenPasswordTextHint)
                            .toString(),
                        controller: _userPasswordInputController,
                        textInputTyped: TextInputType.number,
                        prefixIcon: const Icon(
                          Icons.password,
                        ),
                        validator: (_) {
                          switch (loginStore.isPasswordValid) {
                            case PasswordStatus.valid:
                              return null;
                            case PasswordStatus.invalid:
                              return S
                                  .of(context)
                                  .loginScreenFormInvalidPassword;
                            case PasswordStatus.empty:
                              return S.of(context).loginScreenEmptyFormText;
                          }
                        },
                        obscureText: true,
                      ),
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
                      function: () {
                        final userModel = UserModel(
                          email: _userEmailInputController.text.toString(),
                          password:
                              _userPasswordInputController.text.toString(),
                        );
                        loginStore.setUser(userModel);
                        final isValidEmail =
                            _formKeyEmail.currentState?.validate() ?? false;
                        final isValidPassword =
                            _formKeyPassword.currentState?.validate() ?? false;
                        if (isValidEmail && isValidPassword) {
                          loginStore.doLogin();
                        }
                      },
                      textButton: (S.of(context).loginScreenSignInTextButton)
                          .toString(),
                      colorButton: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
