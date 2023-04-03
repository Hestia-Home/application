import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class GetUserUsecase {
  final ILocalRepository _localRepository;

  const GetUserUsecase(this._localRepository);

  Future<UserEntity> call() async => await _localRepository.getUser();
}
