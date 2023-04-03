abstract class IRemoteRepository {
  Stream get sensorStream;
  void setTargetTemperatureInWeatherStation(double targetTemperature);
}
