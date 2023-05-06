// ignore_for_file: library_private_types_in_public_api, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:developer' as developer;

part 'appbar_store.g.dart';

class _MockUser extends UserEntity {
  const _MockUser() : super(isLoggedIn: true, name: "Пользователь");
}

class AppBarStore = _AppBarStore with _$AppBarStore;

abstract class _AppBarStore with Store {
  final ILocalRepository _localRepository;

  _AppBarStore(this._localRepository) {
    _date = DateTime.now();

    _dateStreamController = StreamController();

    _dateStreamController.add(_date);

    dateStream = ObservableStream(_dateStreamController.stream);

    try {
      getUserAvatar();
      getUser();
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
  UserEntity user = const _MockUser();

  @observable
  ImageProvider image = const AssetImage('assets/main/empty_user_icon.jpg');

  late DateTime _date;

  late StreamController<DateTime> _dateStreamController;

  late ObservableStream<DateTime> dateStream;

  @action
  void getUserAvatar() {
    _localRepository.getUserAvatarImage().then((value) =>
        image = value ?? const AssetImage('assets/main/empty_user_icon.jpg'));
  }

  @action
  void getUser() {
    _localRepository
        .getUser()
        .then((value) => user = value ?? const _MockUser());
  }
}
