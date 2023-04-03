import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class SetUserUsecase {
  final ILocalRepository _localRepository;

  const SetUserUsecase(this._localRepository);

  Future<void> call({
    required String userName,
    required String userId,
    required bool isLoggedIn,
  }) async =>
      await _localRepository.setUser(
          userName: userName, userId: userId, isLoggedIn: isLoggedIn);
}
