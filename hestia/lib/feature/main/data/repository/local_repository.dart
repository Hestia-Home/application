import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';

class LocalRepository implements ILocalRepository {
  final ILocalDataSource _localDataSource;

  const LocalRepository(this._localDataSource);

  @override
  Future<UserEntity> getUser() async {
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
  Future<ImageProvider> getUserAvatarImage() async =>
      _localDataSource.getUserAvatarImage();

  @override
  List<String> getMainPageRoomList() => _localDataSource.getMainPageRoomList();

  @override
  bool isMainPageRoomListExists() =>
      _localDataSource.isMainPageRoomListExists();

  @override
  void setMainPageRoomList(List<String> roomList) =>
      _localDataSource.setMainPageRoomList(roomList);

  @override
  Map<String, List<int>> getInitializedDevicesToRoomsMap() =>
      _localDataSource.getInitializedDevicesToRoomsMap();

  @override
  bool isDevicesMapExists() => _localDataSource.isDevicesMapExists();

  @override
  void setDeviceMap(int deviceId, String roomName) =>
      _localDataSource.setDeviceMap(deviceId, roomName);
}
