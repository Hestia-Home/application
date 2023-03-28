import 'package:flutter_smarthome/feature/main/domain/entity/lighting_device_entity.dart';

class LightingDeviceModel extends LightingDeviceEntity {
  const LightingDeviceModel(
      {required super.id, required super.isOn, required super.roomName});

  factory LightingDeviceModel.fromJson(Map<String, dynamic> json) {
    return LightingDeviceModel(
        id: json['data']['id'] as int,
        isOn: json['data']['is_on'] as bool,
        roomName: json['data']['room_name']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "is_on": isOn};
  }
}
