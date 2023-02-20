import 'package:flutter_smarthome/feature/auth/domain/repository/i_remote_repository.dart';

class ConnectToSmarthomeUsecase {
  IRemoteRepository remoteRepository;
  ConnectToSmarthomeUsecase({required this.remoteRepository});

  void call() => remoteRepository.connectToSmarthome();
}
