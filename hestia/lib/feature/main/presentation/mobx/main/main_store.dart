// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/room_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:developer' as developer;

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  late final ILocalRepository _localRepository;

  _MainStore(ILocalRepository localRepository)
      : _localRepository = localRepository {
    try {
      _devicesStreamFromRepository = _localRepository.devicesFromDBStream();

      _roomsStreamFromRepository = _localRepository.watchRoomList();

      devicesStream = ObservableStream(_devicesStreamFromRepository);

      roomsListStream = ObservableStream(_roomsStreamFromRepository,
          initialValue: [const RoomEntity(id: 0, name: "Все устройства")]);

      devicesStream.hasError ? _setErrorState(devicesStream.error) : null;

      devicesStream.value == null ? _setEmptyState() : null;
    } catch (e) {
      _setErrorState(e.toString());
    }
  }

  @readonly
  late Stream<List<RoomEntity>> _roomsStreamFromRepository;

  @readonly
  late Stream<List<Device>> _devicesStreamFromRepository;

  @observable
  late ObservableStream<List<RoomEntity>> roomsListStream;

  @observable
  String errorMessage = "";

  @observable
  bool isErrorState = false;

  @observable
  bool isEmptyState = false;

  @observable
  late ObservableStream<List<Device>> devicesStream;

  @action
  void _setErrorState(String error) {
    developer.log(error);
    isErrorState = true;
    errorMessage = error;
  }

  @action
  void _setEmptyState() {
    isEmptyState = true;
  }

  @action
  void tryAgainIfError() {
    isErrorState = false;
    errorMessage = '';
  }
}
