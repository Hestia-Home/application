import 'dart:convert';

import 'package:flutter_smarthome/feature/main/data/data_source/database/db.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';

class TemperatureSensorModel extends TemperatureSensorEntity {
  const TemperatureSensorModel({
    required super.id,
    required super.temperature,
  });

  factory TemperatureSensorModel.fromJson(Map<String, dynamic> json) {
    return TemperatureSensorModel(
      id: json['data']['device_id'] as int,
      temperature: json['data']['temperature'] as double,
    );
  }

  factory TemperatureSensorModel.fromDB(Devices device) {
    final json = jsonDecode(device.data);
    return TemperatureSensorModel(
        id: device.id, temperature: double.tryParse(json['temperature']) ?? 0);
  }
}
