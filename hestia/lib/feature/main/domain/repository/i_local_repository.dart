import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';

abstract class ILocalRepository {
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn});
  Future<UserEntity> getUser();
  Future<ImageProvider> getUserAvatarImage();
  Future<void> saveUserAvatarImage();
  bool isMainPageRoomListExists();
  List<String> getMainPageRoomList();
  void setMainPageRoomList(List<String> roomList);
  Map<String, List<int>> getInitializedDevicesToRoomsMap();
  void setDeviceMap(int deviceId, String roomName);
  bool isDevicesMapExists();
  Stream<List<Device>> devicesFromDBStream();
}
