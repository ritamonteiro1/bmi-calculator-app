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
  String get homeScreenWelcomeText {
    return Intl.message(
      'Welcome!',
      name: 'homeScreenWelcomeText',
      desc: '',
      args: [],
    );
  }

  /// `BMI Calculator`
  String get homeScreenCalculatorText {
    return Intl.message(
      'BMI Calculator',
      name: 'homeScreenCalculatorText',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get homeScreenUserTextHint {
    return Intl.message(
      'User',
      name: 'homeScreenUserTextHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get homeScreenPasswordTextHint {
    return Intl.message(
      'Password',
      name: 'homeScreenPasswordTextHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get homeScreenSignInTextButton {
    return Intl.message(
      'Sign in',
      name: 'homeScreenSignInTextButton',
      desc: '',
      args: [],
    );
  }

  /// `BMI Calculator`
  String get mainScreenAppBarTitle {
    return Intl.message(
      'BMI Calculator',
      name: 'mainScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Weight (kg)`
  String get mainScreenWeightTextField {
    return Intl.message(
      'Weight (kg)',
      name: 'mainScreenWeightTextField',
      desc: '',
      args: [],
    );
  }

  /// `Height (cm)`
  String get mainScreenHeightTextField {
    return Intl.message(
      'Height (cm)',
      name: 'mainScreenHeightTextField',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get mainScreenCalculateTextButton {
    return Intl.message(
      'Calculate',
      name: 'mainScreenCalculateTextButton',
      desc: '',
      args: [],
    );
  }

  /// `You are underweight`
  String get mainScreenTextBmiResultUnderWeight {
    return Intl.message(
      'You are underweight',
      name: 'mainScreenTextBmiResultUnderWeight',
      desc: '',
      args: [],
    );
  }

  /// `You are at your ideal weight`
  String get mainScreenTextBmiResultIdealWeight {
    return Intl.message(
      'You are at your ideal weight',
      name: 'mainScreenTextBmiResultIdealWeight',
      desc: '',
      args: [],
    );
  }

  /// `You are slightly overweight`
  String get mainScreenTextBmiResultSlightlyOverweight {
    return Intl.message(
      'You are slightly overweight',
      name: 'mainScreenTextBmiResultSlightlyOverweight',
      desc: '',
      args: [],
    );
  }

  /// `You are obese level I`
  String get mainScreenTextBmiResultObesityLevelI {
    return Intl.message(
      'You are obese level I',
      name: 'mainScreenTextBmiResultObesityLevelI',
      desc: '',
      args: [],
    );
  }

  /// `You are obese level II`
  String get mainScreenTextBmiResultObesityLevelII {
    return Intl.message(
      'You are obese level II',
      name: 'mainScreenTextBmiResultObesityLevelII',
      desc: '',
      args: [],
    );
  }

  /// `You are obese level III`
  String get mainScreenTextBmiResultObesityLevelIII {
    return Intl.message(
      'You are obese level III',
      name: 'mainScreenTextBmiResultObesityLevelIII',
      desc: '',
      args: [],
    );
  }

  /// `Enter weight and height`
  String get mainScreenTextBmiResultNoInformationYet {
    return Intl.message(
      'Enter weight and height',
      name: 'mainScreenTextBmiResultNoInformationYet',
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
