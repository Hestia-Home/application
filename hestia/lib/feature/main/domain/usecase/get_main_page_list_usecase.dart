import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class GetMainPageListUsecase {
  final ILocalRepository _localRepository;
  const GetMainPageListUsecase(this._localRepository);

  List<String> call() => _localRepository.getMainPageRoomList();
}
