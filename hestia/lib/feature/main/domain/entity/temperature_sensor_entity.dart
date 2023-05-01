// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'device.dart';

class TemperatureSensorEntity extends Device with EquatableMixin {
  final double temperature;

  const TemperatureSensorEntity({
    required super.id,
    required this.temperature,
  });

  @override
  List<Object?> get props => [id, temperature];
}
