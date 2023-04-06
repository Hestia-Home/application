import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';

class TemperatureSensorModel extends TemperatureSensorEntity {
  const TemperatureSensorModel({
    required super.sensorId,
    required super.temperature,
  });

  factory TemperatureSensorModel.fromJson(Map<String, dynamic> json) {
    return TemperatureSensorModel(
      sensorId: json['data']['device_id'] as int,
      temperature: json['data']['temperature'] as double,
    );
  }
}
