// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStore, Store {
  late final _$_roomsStreamFromRepositoryAtom =
      Atom(name: '_MainStore._roomsStreamFromRepository', context: context);

  Stream<List<RoomEntity>> get roomsStreamFromRepository {
    _$_roomsStreamFromRepositoryAtom.reportRead();
    return super._roomsStreamFromRepository;
  }

  @override
  Stream<List<RoomEntity>> get _roomsStreamFromRepository =>
      roomsStreamFromRepository;

  @override
  set _roomsStreamFromRepository(Stream<List<RoomEntity>> value) {
    _$_roomsStreamFromRepositoryAtom
        .reportWrite(value, super._roomsStreamFromRepository, () {
      super._roomsStreamFromRepository = value;
    });
  }

  late final _$_devicesStreamFromRepositoryAtom =
      Atom(name: '_MainStore._devicesStreamFromRepository', context: context);

  Stream<List<Device>> get devicesStreamFromRepository {
    _$_devicesStreamFromRepositoryAtom.reportRead();
    return super._devicesStreamFromRepository;
  }

  @override
  Stream<List<Device>> get _devicesStreamFromRepository =>
      devicesStreamFromRepository;

  @override
  set _devicesStreamFromRepository(Stream<List<Device>> value) {
    _$_devicesStreamFromRepositoryAtom
        .reportWrite(value, super._devicesStreamFromRepository, () {
      super._devicesStreamFromRepository = value;
    });
  }

  late final _$roomsListStreamAtom =
      Atom(name: '_MainStore.roomsListStream', context: context);

  @override
  ObservableStream<List<RoomEntity>> get roomsListStream {
    _$roomsListStreamAtom.reportRead();
    return super.roomsListStream;
  }

  @override
  set roomsListStream(ObservableStream<List<RoomEntity>> value) {
    _$roomsListStreamAtom.reportWrite(value, super.roomsListStream, () {
      super.roomsListStream = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_MainStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

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

  late final _$devicesStreamAtom =
      Atom(name: '_MainStore.devicesStream', context: context);

  @override
  ObservableStream<List<Device>> get devicesStream {
    _$devicesStreamAtom.reportRead();
    return super.devicesStream;
  }

  @override
  set devicesStream(ObservableStream<List<Device>> value) {
    _$devicesStreamAtom.reportWrite(value, super.devicesStream, () {
      super.devicesStream = value;
    });
  }

  late final _$_MainStoreActionController =
      ActionController(name: '_MainStore', context: context);

  @override
  void _setErrorState(String error) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore._setErrorState');
    try {
      return super._setErrorState(error);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setEmptyState() {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore._setEmptyState');
    try {
      return super._setEmptyState();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tryAgainIfError() {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore.tryAgainIfError');
    try {
      return super.tryAgainIfError();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
roomsListStream: ${roomsListStream},
errorMessage: ${errorMessage},
isErrorState: ${isErrorState},
isEmptyState: ${isEmptyState},
devicesStream: ${devicesStream}
    ''';
  }
}
