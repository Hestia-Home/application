import 'dart:convert';

import '../data_source/database/db.dart';

class DeviceToDbModel extends Devices {
  DeviceToDbModel(
      {required super.id,
      required super.deviceType,
      required super.data,
      required super.roomId});
  factory DeviceToDbModel.fromJson(Map<String, dynamic> json) {
    return DeviceToDbModel(
        data: jsonEncode(json['data']),
        deviceType: int.tryParse(json['device_type'].toString()) ?? 0,
        id: int.tryParse(json['id'].toString()) ?? 0,
        roomId: int.tryParse(json['room_id'].toString()) ?? 0);
  }
}
