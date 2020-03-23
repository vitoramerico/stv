// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$urlAuthorizeTokenAtom =
      Atom(name: '_LoginControllerBase.urlAuthorizeToken');

  @override
  String get urlAuthorizeToken {
    _$urlAuthorizeTokenAtom.context.enforceReadPolicy(_$urlAuthorizeTokenAtom);
    _$urlAuthorizeTokenAtom.reportObserved();
    return super.urlAuthorizeToken;
  }

  @override
  set urlAuthorizeToken(String value) {
    _$urlAuthorizeTokenAtom.context.conditionallyRunInAction(() {
      super.urlAuthorizeToken = value;
      _$urlAuthorizeTokenAtom.reportChanged();
    }, _$urlAuthorizeTokenAtom, name: '${_$urlAuthorizeTokenAtom.name}_set');
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setUrlAuthorizeToken(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setUrlAuthorizeToken(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'urlAuthorizeToken: ${urlAuthorizeToken.toString()}';
    return '{$string}';
  }
}
