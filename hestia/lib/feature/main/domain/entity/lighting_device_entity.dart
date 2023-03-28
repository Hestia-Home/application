import 'package:equatable/equatable.dart';

class LightingDeviceEntity extends Equatable {
  final int id;
  final bool isOn;
  final String roomName;

  const LightingDeviceEntity(
      {required this.id, required this.isOn, required this.roomName});

  @override
  List<Object?> get props => [id, isOn, roomName];
}
