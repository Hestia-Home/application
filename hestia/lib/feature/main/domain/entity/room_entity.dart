import 'package:equatable/equatable.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';

class RoomEntity extends Equatable {
  final String roomName;
  final TemperatureSensorEntity? sensor;

  const RoomEntity({required this.roomName, this.sensor});

  @override
  List<Object?> get props => [roomName, sensor];
}
