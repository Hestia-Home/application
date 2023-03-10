import 'package:flutter_smarthome/feature/auth/domain/repository/i_local_repository.dart';

class IsSignedIn {
  final ILocalRepository localRepository;
  IsSignedIn(this.localRepository);

  Future<bool> call() async {
    return await localRepository.isSignedIn();
  }
}
