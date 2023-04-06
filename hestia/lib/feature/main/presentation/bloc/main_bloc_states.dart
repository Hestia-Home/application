import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';

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
  final PageController controller;
  final List<String> roomList;
  final ImageProvider? image;
  final Stream deviceDataStream;

  const MainPageLoadedState(
      {required this.deviceDataStream,
      required this.userEntity,
      required this.image,
      required this.controller,
      required this.currentDate,
      required this.initializedDeivcesToRoomsMap,
      required this.roomList});

  @override
  List<Object?> get props => [
        userEntity,
        currentDate,
        initializedDeivcesToRoomsMap,
        controller,
        roomList
      ];
}

class MainPageErrorState extends MainBlocState {
  final String message;

  const MainPageErrorState(this.message);

  @override
  List<Object?> get props => [];
}
