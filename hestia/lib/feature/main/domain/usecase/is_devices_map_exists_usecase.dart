import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class IsDevicesMapExistsUsecase {
  final ILocalRepository _localRepository;

  const IsDevicesMapExistsUsecase(this._localRepository);

  bool call() => _localRepository.isDevicesMapExists();
}
