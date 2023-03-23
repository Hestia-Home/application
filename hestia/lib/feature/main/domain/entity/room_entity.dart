import 'package:equatable/equatable.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';

class RoomEntity extends Equatable {
  final String roomName;
  final bool? isTemperatureSensorInstalled;
  final TemperatureSensorEntity? sensor;

  const RoomEntity(
      {required this.roomName,
      this.isTemperatureSensorInstalled = false,
      this.sensor});

  @override
  List<Object?> get props => [roomName, isTemperatureSensorInstalled, sensor];
}
