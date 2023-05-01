import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class GetSocketStreamUsecase {
  final ILocalRepository _localRepository;

  const GetSocketStreamUsecase(this._localRepository);

  Stream<List<Device>> call() => _localRepository.devicesFromDBStream();
}
