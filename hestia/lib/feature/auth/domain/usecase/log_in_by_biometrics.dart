import 'package:flutter_smarthome/feature/auth/domain/repository/i_local_repository.dart';

class LoginUsecase {
  ILocalRepository localRepository;
  LoginUsecase({required this.localRepository});

  Future<bool> loginByBiometrics() async =>
      await localRepository.authenticate();
}
