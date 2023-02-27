import 'dart:convert';
import 'dart:io';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_entity.dart';
import 'package:web_socket_channel/io.dart';

class RemoteDataSource {
  late Stream<TemperatureData> temperatureStream;
  final IOWebSocketChannel currentTempertaureChannel;
  final IOWebSocketChannel weatherStationChannel;
  // TODO: Add Weather Station API Link to controll temperature inside the room

  RemoteDataSource()
      : currentTempertaureChannel = IOWebSocketChannel.connect(''),
        weatherStationChannel = IOWebSocketChannel.connect('') {
    // TODO: Set Channel Link
    temperatureStream = currentTempertaureChannel.stream.map((event) {
      final parsedJson = json.decode(event);
      final currentTemperature =
          double.parse(parsedJson['currentTemperature'] ?? 0);
      return TemperatureData(currentTemperature);
    }).asBroadcastStream();
  }

  void setTargetTemperature(double target) {
    weatherStationChannel.sink.add(target);
  }

  void dispose() {
    currentTempertaureChannel.sink.close();
    weatherStationChannel.sink.close();
  }
}
