abstract class IRemoteRepository {
  Stream get deviceStream;
  void setTargetTemperatureInWeatherStation(double targetTemperature);
  void dispose() {}
}
