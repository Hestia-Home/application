// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStore, Store {
  late final _$isErrorStateAtom =
      Atom(name: '_MainStore.isErrorState', context: context);

  @override
  bool get isErrorState {
    _$isErrorStateAtom.reportRead();
    return super.isErrorState;
  }

  @override
  set isErrorState(bool value) {
    _$isErrorStateAtom.reportWrite(value, super.isErrorState, () {
      super.isErrorState = value;
    });
  }

  late final _$isEmptyStateAtom =
      Atom(name: '_MainStore.isEmptyState', context: context);

  @override
  bool get isEmptyState {
    _$isEmptyStateAtom.reportRead();
    return super.isEmptyState;
  }

  @override
  set isEmptyState(bool value) {
    _$isEmptyStateAtom.reportWrite(value, super.isEmptyState, () {
      super.isEmptyState = value;
    });
  }

  late final _$_streamFromRepositoryAtom =
      Atom(name: '_MainStore._streamFromRepository', context: context);

  Stream<List<Device>> get streamFromRepository {
    _$_streamFromRepositoryAtom.reportRead();
    return super._streamFromRepository;
  }

  @override
  Stream<List<Device>> get _streamFromRepository => streamFromRepository;

  @override
  set _streamFromRepository(Stream<List<Device>> value) {
    _$_streamFromRepositoryAtom.reportWrite(value, super._streamFromRepository,
        () {
      super._streamFromRepository = value;
    });
  }

  late final _$_MainStoreActionController =
      ActionController(name: '_MainStore', context: context);

  @override
  dynamic _setErrorState(String error) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore._setErrorState');
    try {
      return super._setErrorState(error);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setEmptyState() {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore._setEmptyState');
    try {
      return super._setEmptyState();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isErrorState: ${isErrorState},
isEmptyState: ${isEmptyState}
    ''';
  }
}
