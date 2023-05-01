import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';

abstract class MainBlocState extends Equatable {
  const MainBlocState();
  @override
  List<Object?> get props => [];
}

class InitState extends MainBlocState {
  const InitState();
  @override
  List<Object?> get props => [];
}

/// Shows `Progress Indicator` while loading user's data
class PageLoadingState extends MainBlocState {
  const PageLoadingState();

  @override
  List<Object?> get props => [];
}

class MainPageLoadedState extends MainBlocState {
  final UserEntity userEntity;
  final StreamController<DateTime> currentDate;
  final Map<String, dynamic> initializedDeivcesToRoomsMap;
  final List<String> roomList;
  final ImageProvider? image;
  final Stream<List<Device>> deviceDataStream;

  const MainPageLoadedState(
      {required this.deviceDataStream,
      required this.userEntity,
      required this.image,
      required this.currentDate,
      required this.initializedDeivcesToRoomsMap,
      required this.roomList});

  @override
  List<Object?> get props =>
      [userEntity, currentDate, initializedDeivcesToRoomsMap, roomList];
}

class MainPageErrorState extends MainBlocState {
  final String message;

  const MainPageErrorState(this.message);

  @override
  List<Object?> get props => [];
}
