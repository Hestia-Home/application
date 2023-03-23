import 'package:flutter_smarthome/feature/main/data/model/sensor_model.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/room_entity.dart';

class RoomModel extends RoomEntity {
  const RoomModel({required super.roomName, super.sensor});

  // Parsing data and checking if there is sensor installed in our room
  factory RoomModel.fromJson(Map<String, dynamic> json) {
    final tempSensor =
        json["sensors"] == null ? null : TemperatureSensorModel.fromJson(json);
    return RoomModel(roomName: json["room_name"], sensor: tempSensor);
  }
}
