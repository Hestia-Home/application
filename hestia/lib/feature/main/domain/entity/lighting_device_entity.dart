import 'package:equatable/equatable.dart';

class LightingDeviceEntity extends Equatable {
  final int id;
  final bool isOn;

  const LightingDeviceEntity({required this.id, required this.isOn});

  @override
  List<Object?> get props => [id, isOn];
}
