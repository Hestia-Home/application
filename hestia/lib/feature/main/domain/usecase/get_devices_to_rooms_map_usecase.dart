import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class GetDevicesToRoomsMapUsecase {
  final ILocalRepository _localRepository;

  const GetDevicesToRoomsMapUsecase(this._localRepository);

  Map<String, List<int>> call() =>
      _localRepository.getInitializedDevicesToRoomsMap();
}
