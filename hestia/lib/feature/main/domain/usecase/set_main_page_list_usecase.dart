import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class SetMainPageListUsecase {
  final ILocalRepository _localRepository;

  SetMainPageListUsecase(this._localRepository);

  void call(List<String> roomList) =>
      _localRepository.setMainPageRoomList(roomList);
}
