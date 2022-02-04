// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome!`
  String get loginScreenWelcomeText {
    return Intl.message(
      'Welcome!',
      name: 'loginScreenWelcomeText',
      desc: '',
      args: [],
    );
  }

  /// `BMI Calculator`
  String get loginScreenCalculatorText {
    return Intl.message(
      'BMI Calculator',
      name: 'loginScreenCalculatorText',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get loginScreenUserTextHint {
    return Intl.message(
      'User',
      name: 'loginScreenUserTextHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginScreenPasswordTextHint {
    return Intl.message(
      'Password',
      name: 'loginScreenPasswordTextHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address. Ex: abc@abc.com.br`
  String get loginScreenFormInvalidEmail {
    return Intl.message(
      'Enter a valid email address. Ex: abc@abc.com.br',
      name: 'loginScreenFormInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Fill the field`
  String get loginScreenEmptyFormText {
    return Intl.message(
      'Fill the field',
      name: 'loginScreenEmptyFormText',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 6 characters`
  String get loginScreenFormInvalidPassword {
    return Intl.message(
      'Password must contain at least 6 characters',
      name: 'loginScreenFormInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get loginScreenSignInTextButton {
    return Intl.message(
      'Sign in',
      name: 'loginScreenSignInTextButton',
      desc: '',
      args: [],
    );
  }

  /// `BMI Calculator`
  String get calculatorScreenAppBarTitle {
    return Intl.message(
      'BMI Calculator',
      name: 'calculatorScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Weight (kg)`
  String get calculatorScreenWeightTextField {
    return Intl.message(
      'Weight (kg)',
      name: 'calculatorScreenWeightTextField',
      desc: '',
      args: [],
    );
  }

  /// `Height (cm)`
  String get calculatorScreenHeightTextField {
    return Intl.message(
      'Height (cm)',
      name: 'calculatorScreenHeightTextField',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get calculatorScreenCalculateTextButton {
    return Intl.message(
      'Calculate',
      name: 'calculatorScreenCalculateTextButton',
      desc: '',
      args: [],
    );
  }

  /// `You are underweight`
  String get calculatorScreenTextBmiResultUnderWeight {
    return Intl.message(
      'You are underweight',
      name: 'calculatorScreenTextBmiResultUnderWeight',
      desc: '',
      args: [],
    );
  }

  /// `You are at your ideal weight`
  String get calculatorScreenTextBmiResultIdealWeight {
    return Intl.message(
      'You are at your ideal weight',
      name: 'calculatorScreenTextBmiResultIdealWeight',
      desc: '',
      args: [],
    );
  }

  /// `You are slightly overweight`
  String get calculatorScreenTextBmiResultSlightlyOverweight {
    return Intl.message(
      'You are slightly overweight',
      name: 'calculatorScreenTextBmiResultSlightlyOverweight',
      desc: '',
      args: [],
    );
  }

  /// `You are obese level I`
  String get calculatorScreenTextBmiResultObesityLevelI {
    return Intl.message(
      'You are obese level I',
      name: 'calculatorScreenTextBmiResultObesityLevelI',
      desc: '',
      args: [],
    );
  }

  /// `You are obese level II`
  String get calculatorScreenTextBmiResultObesityLevelII {
    return Intl.message(
      'You are obese level II',
      name: 'calculatorScreenTextBmiResultObesityLevelII',
      desc: '',
      args: [],
    );
  }

  /// `You are obese level III`
  String get calculatorScreenTextBmiResultObesityLevelIII {
    return Intl.message(
      'You are obese level III',
      name: 'calculatorScreenTextBmiResultObesityLevelIII',
      desc: '',
      args: [],
    );
  }

  /// `Enter weight and height`
  String get calculatorScreenTextBmiResultNoInformationYet {
    return Intl.message(
      'Enter weight and height',
      name: 'calculatorScreenTextBmiResultNoInformationYet',
      desc: '',
      args: [],
    );
  }

  /// `Hi, `
  String get calculatorScreenTextHello {
    return Intl.message(
      'Hi, ',
      name: 'calculatorScreenTextHello',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
