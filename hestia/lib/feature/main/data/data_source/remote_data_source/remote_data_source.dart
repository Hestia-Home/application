import 'dart:async';
import 'dart:convert';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/model/lighting_device_model.dart';
import 'package:flutter_smarthome/feature/main/data/model/sensor_model.dart';
import 'package:web_socket_channel/io.dart';

class RemoteDataSource implements IRemoteDataSource {
  late Stream _sensorStream;
  final IOWebSocketChannel _channel;
  RemoteDataSource()
      : _channel =
            IOWebSocketChannel.connect(Uri.parse('ws://10.0.2.2:8000/ws/1')) {
    // Temperature tracking stream from temperature sensor
    // If no temperature sensor installed inside the room returns null
    _sensorStream = _channel.stream.map((event) {
      Map<String, dynamic> json = jsonDecode(event);
      int id = json['id'] as int;
      switch (id) {
        case 1:
          return TemperatureSensorModel.fromJson(json);
        case 2:
          return LightingDeviceModel.fromJson(json);
      }
    }).asBroadcastStream();
  }
  @override
  Stream get sensorStream => _sensorStream;

  @override
  void setTargetTemperatureInWeatherStation(double targerTemperature) {
    final data = {
      "weather_station": "weather_station",
      "targer_temperature": targerTemperature
    };
    _channel.sink.add(data);
  }

  void dispose() {
    _channel.sink.close();
  }
}
