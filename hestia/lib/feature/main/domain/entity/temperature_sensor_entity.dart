// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TemperatureSensorEntity extends Equatable {
  final int sensorId;
  final double temperature;

  const TemperatureSensorEntity({
    required this.sensorId,
    required this.temperature,
  });

  @override
  List<Object?> get props => [sensorId, temperature];
}
