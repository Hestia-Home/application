import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/room_entity.dart';

abstract class ILocalDataSource {
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn});
  Future<UserEntity?> getUser();
  Future<ImageProvider?> getUserAvatarImage();
  Stream<List<Device>> devicesFromDBStream();
  Future<void> createOrUpdateDeviceInfo(Map<String, dynamic> json);
  Future<void> createOrUpdateRoomInfo(Map<String, dynamic> json);
  Future<void> saveUserAvatarImage();
  Stream<List<RoomEntity>> watchRoomList();
  void setRoomList(List<String> roomList);
}
