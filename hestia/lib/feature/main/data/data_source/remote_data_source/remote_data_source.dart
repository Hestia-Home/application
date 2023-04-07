import 'dart:async';
import 'dart:convert';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/model/lighting_device_model.dart';
import 'package:flutter_smarthome/feature/main/data/model/sensor_model.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';
import 'package:web_socket_channel/io.dart';

class RemoteDataSource implements IRemoteDataSource {
  late Stream _deviceStream;
  final IOWebSocketChannel _channel;
  RemoteDataSource()
      : _channel =
            IOWebSocketChannel.connect(Uri.parse('ws://10.0.2.2:8000/ws/2')) {
    _deviceStream = _channel.stream.map((event) {
      try {
        Map<String, dynamic> json = jsonDecode(event);
        int id = json['id'] as int;
        if (json['data'] != null) {
          switch (id) {
            case 1:
              return TemperatureSensorModel.fromJson(json);
            case 2:
              return LightingDeviceModel.fromJson(json);
          }
        }
      } catch (e) {
        Exception(e.toString());
      }
    }).asBroadcastStream();
  }
  @override
  Stream get deviceStream => _deviceStream;

  @override
  void setTargetTemperatureInWeatherStation(double targetTemperature) {
    final data = {
      "weather_station": "weather_station",
      "targer_temperature": targetTemperature
    };
    _channel.sink.add(data);
  }

  @override
  void dispose() => _channel.sink.close();
}
