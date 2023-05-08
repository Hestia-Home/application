import 'package:flutter_smarthome/feature/main/data/data_source/database/db.dart';

class RoomToDbModel extends Room {
  RoomToDbModel({required super.roomName, required super.id});
  factory RoomToDbModel.fromJson(Map<String, dynamic> json) {
    return RoomToDbModel(
        roomName: json['room_name'],
        id: int.tryParse(json['room_id'].toString()) ?? 0);
  }
}
