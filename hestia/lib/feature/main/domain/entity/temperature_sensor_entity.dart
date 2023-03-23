// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TemperatureSensorEntity extends Equatable {
  final String roomName;
  final int sensorId;
  double temperature;

  TemperatureSensorEntity(
      {required this.sensorId,
      required this.temperature,
      required this.roomName});

  @override
  List<Object?> get props => [sensorId, temperature, roomName];
}
