// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TvSeriesController on _TvSeriesControllerBase, Store {
  final _$errorMessageAtom = Atom(name: '_TvSeriesControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_TvSeriesControllerBaseActionController =
      ActionController(name: '_TvSeriesControllerBase');

  @override
  dynamic setErrorMessage(String value) {
    final _$actionInfo =
        _$_TvSeriesControllerBaseActionController.startAction();
    try {
      return super.setErrorMessage(value);
    } finally {
      _$_TvSeriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _getData() {
    final _$actionInfo =
        _$_TvSeriesControllerBaseActionController.startAction();
    try {
      return super._getData();
    } finally {
      _$_TvSeriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _getGenres() {
    final _$actionInfo =
        _$_TvSeriesControllerBaseActionController.startAction();
    try {
      return super._getGenres();
    } finally {
      _$_TvSeriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'errorMessage: ${errorMessage.toString()}';
    return '{$string}';
  }
}
