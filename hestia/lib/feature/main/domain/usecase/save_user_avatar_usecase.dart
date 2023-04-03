import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class SaveUserAvatarUsecase {
  final ILocalRepository _localRepository;

  const SaveUserAvatarUsecase(this._localRepository);

  Future<void> call() async => _localRepository.saveUserAvatarImage();
}
