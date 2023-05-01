import 'dart:async';

import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:developer' as developer;

part 'appbar_store.g.dart';

class AppBarStore = _AppBarStore with _$AppBarStore;

abstract class _AppBarStore with Store {
  final ILocalRepository _localRepository;

  _AppBarStore(this._localRepository) {
    _date = DateTime.now();
    _dateStreamController = StreamController();

    _dateStreamController.add(_date);

    dateStream = ObservableStream(_dateStreamController.stream);

    try {
      _localRepository.getUser().then((value) => user = value);
    } on Exception catch (e) {
      developer.log(e.toString());
    }

    Timer.periodic(const Duration(seconds: 1), (timer) {
      final DateTime newDate = DateTime.now();
      if (newDate.day > _date.day) {
        _date = newDate;
        _dateStreamController.add(_date);
      }
    });
  }

  @observable
  late UserEntity user;

  @readonly
  late DateTime _date;

  @readonly
  late StreamController<DateTime> _dateStreamController;

  late ObservableStream<DateTime> dateStream;
}
