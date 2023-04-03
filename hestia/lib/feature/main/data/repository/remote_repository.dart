import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/i_remote_data_source.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_remote_repository.dart';

class RemoteRepository implements IRemoteRepository {
  final IRemoteDataSource _remoteDataSource;
  RemoteRepository(this._remoteDataSource);

  @override
  Stream get sensorStream => _remoteDataSource.sensorStream;

  @override
  void setTargetTemperatureInWeatherStation(double targetTemperature) {
    _remoteDataSource.setTargetTemperatureInWeatherStation(targetTemperature);
  }
}
