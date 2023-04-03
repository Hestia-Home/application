import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';

abstract class ILocalDataSource {
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn});
  Future<UserEntity> getUser();
  Future<Image> getUserAvatarImage();
  Future<void> saveUserAvatarImage();
}
