// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$userTokenAtom = Atom(name: '_AuthControllerBase.userToken');

  @override
  UserTokenModel get userToken {
    _$userTokenAtom.context.enforceReadPolicy(_$userTokenAtom);
    _$userTokenAtom.reportObserved();
    return super.userToken;
  }

  @override
  set userToken(UserTokenModel value) {
    _$userTokenAtom.context.conditionallyRunInAction(() {
      super.userToken = value;
      _$userTokenAtom.reportChanged();
    }, _$userTokenAtom, name: '${_$userTokenAtom.name}_set');
  }

  final _$requestTokenAtom = Atom(name: '_AuthControllerBase.requestToken');

  @override
  String get requestToken {
    _$requestTokenAtom.context.enforceReadPolicy(_$requestTokenAtom);
    _$requestTokenAtom.reportObserved();
    return super.requestToken;
  }

  @override
  set requestToken(String value) {
    _$requestTokenAtom.context.conditionallyRunInAction(() {
      super.requestToken = value;
      _$requestTokenAtom.reportChanged();
    }, _$requestTokenAtom, name: '${_$requestTokenAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setUserToken(UserTokenModel value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setUserToken(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRequestToken(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setRequestToken(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'userToken: ${userToken.toString()},requestToken: ${requestToken.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
