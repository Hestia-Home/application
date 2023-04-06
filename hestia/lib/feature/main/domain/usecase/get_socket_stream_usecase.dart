import 'package:flutter_smarthome/feature/main/domain/repository/i_remote_repository.dart';

class GetSocketStreamUsecase {
  final IRemoteRepository _remoteRepository;

  const GetSocketStreamUsecase(this._remoteRepository);

  Stream call() => _remoteRepository.deviceStream;

  void dispose() => _remoteRepository.dispose();
}
