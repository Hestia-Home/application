import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/database/db.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/core/common/data/model/user_model.dart';
import 'package:flutter_smarthome/feature/main/data/model/device_model.dart';
import 'package:flutter_smarthome/feature/main/data/model/lighting_device_model.dart';
import 'package:flutter_smarthome/feature/main/data/model/room_model.dart';
import 'package:flutter_smarthome/feature/main/data/model/sensor_model.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/room_entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as dev;

class LocalDataSource implements ILocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final HestiaDB _hestiaDB;

  const LocalDataSource(this._secureStorage, this._hestiaDB);

  @override
  Stream<List<Device>> devicesFromDBStream() {
    Stream<List<Device>> str = _hestiaDB.watchDevices().map((event) {
      final List<Device> deviceList = [];

      /// Mapping list of new event and checking [deviceType]
      /// After that new devices added in [deviceList] which is returned in new stream

      for (var element in event) {
        final device = element.deviceType;
        switch (device) {
          case 1:
            try {
              deviceList.add(TemperatureSensorModel.fromDB(element));
            } catch (e) {
              dev.log(e.toString());
            }
            break;
          case 2:
            deviceList.add(LightingDeviceModel.fromDB(element));
            break;
        }
      }
      return deviceList;
    });

    return str;
  }

  @override
  Future<void> createOrUpdateDeviceInfo(Map<String, dynamic> json) async {
    final Devices device = DeviceToDbModel.fromJson(json);
    await _hestiaDB.createOrUpdateDeviceInfo(device);
  }

  @override
  Future<UserEntity?> getUser() async {
    final userData = await _secureStorage.read(key: 'user') ?? '';
    final UserEntity user = UserModel.fromJson(jsonDecode(userData));
    return user;
  }

  @override
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn}) async {
    final String userModel =
        UserModel(name: userName, isLoggedIn: isLoggedIn).toJson().toString();
    await _secureStorage.write(key: 'user', value: userModel);
  }

  @override
  Future<void> saveUserAvatarImage() async {
    final userImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final path = (await getApplicationDocumentsDirectory()).path;
    if (userImage != null) userImage.saveTo("$path/avatar.jpg");
  }

  @override
  Future<ImageProvider?> getUserAvatarImage() async {
    late final ImageProvider? image;
    try {
      final String path = (await getApplicationDocumentsDirectory()).path;
      final bool isFileExists = io.File("$path/avatar.jpg").existsSync();
      if (isFileExists) image = FileImage(File("$path/avatar.jpg"));
    } on Exception catch (e) {
      dev.log(e.toString());
    }
    return image;
  }

  @override
  void setRoomList(List<String> roomList) async {}

  @override
  Stream<List<RoomEntity>> watchRoomList() {
    final streamFromDb = _hestiaDB.watchRooms();

    final roomsStream = streamFromDb.map((event) {
      final List<RoomEntity> list = [];
      for (var room in event) {
        list.add(RoomEntity(id: room.id, name: room.roomName));
      }
      return list;
    });

    return roomsStream;
  }

  @override
  Future<void> createOrUpdateRoomInfo(Map<String, dynamic> json) async {
    final room = RoomToDbModel.fromJson(json);
    await _hestiaDB.createOrUpdateRoomInfo(room);
  }
}
