// ignore_for_file: library_private_types_in_public_api, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:developer' as developer;

part 'appbar_store.g.dart';

class _MockUser extends UserEntity {
  const _MockUser() : super(isLoggedIn: true, name: "Станислав Моисеев");
}

class AppBarStore = _AppBarStore with _$AppBarStore;

abstract class _AppBarStore with Store {
  final ILocalRepository _localRepository;

  _AppBarStore(this._localRepository) {
    DateTime date = DateTime.now();

    _dateStreamController.add(date);

    _dateStreamUpdate(date);
  }

  @observable
  ObservableFuture<UserEntity> user = ObservableFuture.value(const _MockUser());

  @observable
  ObservableFuture<ImageProvider> image =
      ObservableFuture.value(const AssetImage('assets/main/user_image.jpg'));

  final StreamController<DateTime> _dateStreamController = StreamController();

  late ObservableStream<DateTime> dateStream =
      ObservableStream(_dateStreamController.stream);

  @action
  getUserAvatar() async {
    try {
      image = ObservableFuture(_getImage());
      await image;
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  @action
  getUser() async {
    try {
      user = ObservableFuture(_getUser());
      await user;
    } catch (e) {
      developer.log(e.toString());
    }
  }

  void _dateStreamUpdate(DateTime _date) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final DateTime newDate = DateTime.now();
      if (newDate.day > _date.day) {
        _date = newDate;
        _dateStreamController.add(_date);
      }
    });
  }

  Future<ImageProvider> _getImage() async {
    final loadedImage = (await _localRepository.getUserAvatarImage()) ??
        const AssetImage('assets/main/user_image.jpg');
    return loadedImage;
  }

  Future<UserEntity> _getUser() async {
    final loadedUser = (await _localRepository.getUser()) ?? const _MockUser();
    return loadedUser;
  }
}
