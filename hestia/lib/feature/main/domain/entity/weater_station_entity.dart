import 'package:flutter_smarthome/feature/main/domain/entity/target_temperature.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_entity.dart';

class WeatherStation {
  final TargetTemperature targetTemperature;
  TemperatureData currentTemperature;

  WeatherStation(this.targetTemperature, this.currentTemperature);
}
