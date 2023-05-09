import 'dart:convert';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:developer' as dev;

class RemoteDataSource implements IRemoteDataSource {
  final IOWebSocketChannel _channel;
  final ILocalDataSource _localDataSource;
  RemoteDataSource(this._localDataSource)
      : _channel =
            IOWebSocketChannel.connect(Uri.parse('ws://10.0.2.2:8000/ws/2')) {
    _channel.stream.listen((event) {
      try {
        Map<String, dynamic> json = jsonDecode(event.toString());
        _localDataSource.createOrUpdateRoomInfo(json['room']);
        _localDataSource.createOrUpdateDeviceInfo(json);
      } catch (e) {
        dev.log(e.toString());
        Exception(e.toString());
      }
    });
  }

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
