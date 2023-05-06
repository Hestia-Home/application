import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/room_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class LocalRepository implements ILocalRepository {
  final ILocalDataSource _localDataSource;

  const LocalRepository(this._localDataSource);

  @override
  Future<UserEntity?> getUser() async {
    return await _localDataSource.getUser();
  }

  @override
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn}) async {
    await _localDataSource.setUser(
        userName: userName, userId: userId, isLoggedIn: isLoggedIn);
  }

  @override
  Future<void> saveUserAvatarImage() async =>
      await _localDataSource.saveUserAvatarImage();

  @override
  Future<ImageProvider?> getUserAvatarImage() async =>
      _localDataSource.getUserAvatarImage();

  @override
  Stream<List<RoomEntity>> watchRoomList() => _localDataSource.watchRoomList();

  @override
  void setRoomList(List<String> roomList) =>
      _localDataSource.setRoomList(roomList);

  @override
  Stream<List<Device>> devicesFromDBStream() =>
      _localDataSource.devicesFromDBStream();
}
