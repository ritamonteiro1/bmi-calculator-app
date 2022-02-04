// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;

  final _$emailStatusAtom = Atom(name: '_LoginStore.emailStatus');

  @override
  EmailStatus get emailStatus {
    _$emailStatusAtom.reportRead();
    return super.emailStatus;
  }

  @override
  set emailStatus(EmailStatus value) {
    _$emailStatusAtom.reportWrite(value, super.emailStatus, () {
      super.emailStatus = value;
    });
  }

  final _$passwordStatusAtom = Atom(name: '_LoginStore.passwordStatus');

  @override
  PasswordStatus get passwordStatus {
    _$passwordStatusAtom.reportRead();
    return super.passwordStatus;
  }

  @override
  set passwordStatus(PasswordStatus value) {
    _$passwordStatusAtom.reportWrite(value, super.passwordStatus, () {
      super.passwordStatus = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStore.loading');

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

  final _$loggedInAtom = Atom(name: '_LoginStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$doLoginAsyncAction = AsyncAction('_LoginStore.doLogin');

  @override
  Future<void> doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String? newEmail) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(newEmail);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? newPassword) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(newPassword);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logOut() {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.logOut');
    try {
      return super.logOut();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailStatus: ${emailStatus},
passwordStatus: ${passwordStatus},
loading: ${loading},
loggedIn: ${loggedIn},
isFormValid: ${isFormValid}
    ''';
  }
}
