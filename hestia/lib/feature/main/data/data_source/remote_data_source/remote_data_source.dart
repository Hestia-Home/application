import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:flutter_smarthome/feature/main/data/model/sensor_model.dart';
import 'package:web_socket_channel/io.dart';

class RemoteDataSource {
  // late Stream<TemperatureData> temperatureStream;
  late Stream<SensorModel> temperatureStream;
  final IOWebSocketChannel currentTempertaureChannel;
  // TODO: Add Weather Station API Link to controll temperature inside the room
  RemoteDataSource()
      : currentTempertaureChannel = IOWebSocketChannel.connect(
          Uri.parse('ws://10.0.2.2:8000/ws/1'),
        ) {
    // TODO: Set Channel Link
    temperatureStream = currentTempertaureChannel.stream.map((event) {
      final parsedJson = json.decode(event);
      return SensorModel.fromJson(parsedJson);
    }).asBroadcastStream();
  }

  void dispose() {
    currentTempertaureChannel.sink.close();
  }
}

// class ParseTestData {
//   String roomName;
//   int sensorId;
//   double temperature;

//   ParseTestData(
//       {required this.roomName,
//       required this.temperature,
//       required this.sensorId});

//   factory ParseTestData.fromJson(Map<String, dynamic> json) {
//     return ParseTestData(
//         sensorId: json['sensor_id'] as int,
//         temperature: json['temperature'] as double,
//         roomName: json['room_name']);
//   }
// }


