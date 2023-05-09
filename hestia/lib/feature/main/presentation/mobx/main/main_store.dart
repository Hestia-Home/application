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
      devicesStream.listen((value) {
        value.isNotEmpty ? _setDataRecievedState() : _setEmptyState();
      }).onError((error) {
        _setErrorState(error.toString());
      });

      roomsListStream.listen((value) {
        value.isNotEmpty ? _setDataRecievedState() : _setEmptyState();
      }).onError((error) {
        _setErrorState(error.toString());
      });
    } catch (e) {
      _setErrorState(e.toString());
    }
  }

  late final Stream<List<RoomEntity>> _roomsStreamFromRepository =
      _localRepository.watchRoomList();

  late final Stream<List<Device>> _devicesStreamFromRepository =
      _localRepository.devicesFromDBStream();

  @observable
  late ObservableStream<List<RoomEntity>> roomsListStream = ObservableStream(
      _roomsStreamFromRepository,
      initialValue: [const RoomEntity(id: 0, name: "Все устройства")]);

  @observable
  late ObservableStream<List<Device>> devicesStream =
      ObservableStream(_devicesStreamFromRepository);

  @observable
  String errorMessage = "";

  @observable
  bool isErrorState = false;

  @observable
  bool isEmptyState = false;

  @action
  void _setErrorState(String error) {
    isErrorState = true;
    errorMessage = error;
  }

  @action
  void _setEmptyState() {
    isEmptyState = true;
    Future.delayed(const Duration(seconds: 2), _endErrorState);
  }

  @action
  void _setDataRecievedState() {
    isEmptyState = false;
  }

  @action
  void _endErrorState() {
    isErrorState = false;
  }
}
