import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class SetDevicesMapUsecase {
  final ILocalRepository _localRepository;

  SetDevicesMapUsecase(this._localRepository);

  void call(int deviceId, String roomName) =>
      _localRepository.setDeviceMap(deviceId, roomName);
}
