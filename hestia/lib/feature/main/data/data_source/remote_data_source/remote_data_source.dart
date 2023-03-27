import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/model/room_model.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';
import 'package:web_socket_channel/io.dart';

class RemoteDataSource implements IRemoteDataSource {
  late Stream<TemperatureSensorEntity?> temperatureStream;
  final IOWebSocketChannel currentTempertaureChannel;
  RemoteDataSource()
      : currentTempertaureChannel = IOWebSocketChannel.connect(
          Uri.parse('ws://10.0.2.2:8000/ws/1'),
        ) {
    // Temperature tracking stream from temperature sensor
    // If no temperature sensor installed inside the room returns null

    temperatureStream = currentTempertaureChannel.stream.map((event) {
      var json = jsonDecode(event);
      var roomEntity = RoomModel.fromJson(json);
      if (roomEntity.sensor == null) {
        return null;
      } else {
        return roomEntity.sensor;
      }
    }).asBroadcastStream();
  }
  @override
  void setTargetTemperatureInWeatherStation() {
    //TODO: Implememt this method
  }

  void dispose() {
    currentTempertaureChannel.sink.close();
  }
}
