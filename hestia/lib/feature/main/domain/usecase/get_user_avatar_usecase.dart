import 'package:flutter/material.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class GetUserAvatarUsecase {
  final ILocalRepository _localRepository;

  const GetUserAvatarUsecase(this._localRepository);

  Future<ImageProvider> call() async => _localRepository.getUserAvatarImage();
}
