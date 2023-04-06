abstract class IRemoteDataSource {
  Stream get deviceStream;
  void setTargetTemperatureInWeatherStation(double targetTemperature);
  void dispose() {}
}
