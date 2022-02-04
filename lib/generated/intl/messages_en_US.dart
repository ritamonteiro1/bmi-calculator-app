// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "calculatorScreenAppBarTitle":
            MessageLookupByLibrary.simpleMessage("BMI Calculator"),
        "calculatorScreenCalculateTextButton":
            MessageLookupByLibrary.simpleMessage("Calculate"),
        "calculatorScreenHeightTextField":
            MessageLookupByLibrary.simpleMessage("Height (cm)"),
        "calculatorScreenTextBmiResultIdealWeight":
            MessageLookupByLibrary.simpleMessage(
                "You are at your ideal weight"),
        "calculatorScreenTextBmiResultNoInformationYet":
            MessageLookupByLibrary.simpleMessage("Enter weight and height"),
        "calculatorScreenTextBmiResultObesityLevelI":
            MessageLookupByLibrary.simpleMessage("You are obese level I"),
        "calculatorScreenTextBmiResultObesityLevelII":
            MessageLookupByLibrary.simpleMessage("You are obese level II"),
        "calculatorScreenTextBmiResultObesityLevelIII":
            MessageLookupByLibrary.simpleMessage("You are obese level III"),
        "calculatorScreenTextBmiResultSlightlyOverweight":
            MessageLookupByLibrary.simpleMessage("You are slightly overweight"),
        "calculatorScreenTextBmiResultUnderWeight":
            MessageLookupByLibrary.simpleMessage("You are underweight"),
        "calculatorScreenTextHello":
            MessageLookupByLibrary.simpleMessage("Hi, "),
        "calculatorScreenWeightTextField":
            MessageLookupByLibrary.simpleMessage("Weight (kg)"),
        "loginScreenCalculatorText":
            MessageLookupByLibrary.simpleMessage("BMI Calculator"),
        "loginScreenEmptyFormText":
            MessageLookupByLibrary.simpleMessage("Fill the field"),
        "loginScreenFormInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "Enter a valid email address. Ex: abc@abc.com.br"),
        "loginScreenFormInvalidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least 6 characters"),
        "loginScreenPasswordTextHint":
            MessageLookupByLibrary.simpleMessage("Password"),
        "loginScreenSignInTextButton":
            MessageLookupByLibrary.simpleMessage("Sign in"),
        "loginScreenUserTextHint": MessageLookupByLibrary.simpleMessage("User"),
        "loginScreenWelcomeText":
            MessageLookupByLibrary.simpleMessage("Welcome!")
      };
}
