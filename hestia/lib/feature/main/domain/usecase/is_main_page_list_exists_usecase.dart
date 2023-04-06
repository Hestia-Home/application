import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class IsMainPageListExistsUsecase {
  final ILocalRepository _localRepository;
  const IsMainPageListExistsUsecase(this._localRepository);

  bool call() => _localRepository.isMainPageRoomListExists();
}
