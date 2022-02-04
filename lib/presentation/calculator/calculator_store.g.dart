// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalculatorStore on _CalculatorStore, Store {
  final _$userBmiAtom = Atom(name: '_CalculatorStore.userBmi');

  @override
  Bmi get userBmi {
    _$userBmiAtom.reportRead();
    return super.userBmi;
  }

  @override
  set userBmi(Bmi value) {
    _$userBmiAtom.reportWrite(value, super.userBmi, () {
      super.userBmi = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CalculatorStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$calculateBmiAsyncAction =
      AsyncAction('_CalculatorStore.calculateBmi');

  @override
  Future<void> calculateBmi(UserModel userModel) {
    return _$calculateBmiAsyncAction.run(() => super.calculateBmi(userModel));
  }

  final _$_CalculatorStoreActionController =
      ActionController(name: '_CalculatorStore');

  @override
  void resetBmi() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.resetBmi');
    try {
      return super.resetBmi();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userBmi: ${userBmi},
loading: ${loading}
    ''';
  }
}
