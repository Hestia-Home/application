// ignore_for_file: must_be_immutable

import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';

class TemperatureSensorModel extends TemperatureSensorEntity {
  TemperatureSensorModel(
      {required super.sensorId,
      required super.temperature,
      required super.roomName});

  factory TemperatureSensorModel.fromJson(Map<String, dynamic> json) {
    return TemperatureSensorModel(
      roomName: json['room_name'],
      sensorId: json['sensor_id'] as int,
      temperature: json['temperature'] as double,
    );
  }
}
