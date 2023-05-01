import 'dart:convert';

import 'package:flutter_smarthome/feature/main/data/data_source/database/db.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/lighting_device_entity.dart';

class LightingDeviceModel extends LightingDeviceEntity {
  const LightingDeviceModel({required super.id, required super.isOn});

  factory LightingDeviceModel.fromJson(Map<String, dynamic> json) {
    return LightingDeviceModel(
      id: json['id'] as int,
      isOn: json['data']['is_on'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "is_on": isOn};
  }

  factory LightingDeviceModel.fromDB(Devices device) {
    final json = jsonDecode(device.data);
    return LightingDeviceModel(id: device.id, isOn: json['isOn'] as bool);
  }
}
