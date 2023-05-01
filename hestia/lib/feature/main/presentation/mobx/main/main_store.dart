// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
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
      _streamFromRepository = _localRepository.devicesFromDBStream();

      devicesStream = ObservableStream(_streamFromRepository);

      devicesStream.hasError ? _setErrorState(devicesStream.error) : null;

      devicesStream.value == null ? _setEmptyState() : null;
    } catch (e) {
      _setErrorState(e.toString());
    }
  }

  @observable
  bool isErrorState = false;

  @observable
  bool isEmptyState = false;

  @readonly
  late Stream<List<Device>> _streamFromRepository;

  late ObservableStream<List<Device>> devicesStream;

  @action
  _setErrorState(String error) {
    developer.log(error);
    isErrorState = true;
  }

  @action
  _setEmptyState() {
    isEmptyState = true;
  }
}
