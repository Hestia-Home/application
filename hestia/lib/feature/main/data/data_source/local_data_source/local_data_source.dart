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
import 'package:flutter_smarthome/feature/main/data/model/sensor_model.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataSource implements ILocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final GetStorage _getStorage;
  final HestiaDB _hestiaDB;

  const LocalDataSource(this._secureStorage, this._getStorage, this._hestiaDB);

  @override
  Stream<List<Device>> devicesFromDBStream() {
    Stream<List<Device>> str;

    /// Mapping stream for new events
    str = _hestiaDB.watchDevices().map((event) {
      final List<Device> deviceList = [];

      /// Mapping list of new event and checking [deviceType]
      /// After that new devices added in [deviceList] which is returned in new stream
      event.map((e) {
        final device = e.deviceType;
        switch (device) {
          case 1:
            deviceList.add(TemperatureSensorModel.fromDB(e));
            break;
          case 2:
            deviceList.add(TemperatureSensorModel.fromDB(e));
            break;
        }
      });
      return deviceList;
    });

    return str;
  }

  @override
  Future<void> createOrUpdateDeviceInfo(Map<String, dynamic> json) async {
    final Devices device = Devices.fromJson(json);
    await _hestiaDB.createOrUpdateDeviceInfo(device);
  }

  @override
  Future<UserEntity> getUser() async {
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
  Future<ImageProvider> getUserAvatarImage() async {
    final String path = (await getApplicationDocumentsDirectory()).path;
    final bool isFileExists = io.File("$path/avatar.jpg").existsSync();
    late final ImageProvider image;
    if (isFileExists) image = FileImage(File("$path/avatar.jpg"));
    return image;
  }

  @override
  void setMainPageRoomList(List<String> roomList) =>
      _getStorage.write("main_page_list", jsonEncode(roomList));

  @override
  List<String> getMainPageRoomList() {
    final String dataList = _getStorage.read("main_page_list");
    return jsonDecode(dataList) as List<String>;
  }

  @override
  bool isMainPageRoomListExists() => _getStorage.hasData("main_page_list");

  @override
  Map<String, List<int>> getInitializedDevicesToRoomsMap() {
    final String data = _getStorage.read('initialized_devices');
    final Map<String, List<int>> devicesToRoomsMap =
        jsonDecode(data) as Map<String, List<int>>;
    return devicesToRoomsMap;
  }

  @override
  void setDeviceMap(int deviceId, String roomName) {
    final bool isExists = isDevicesMapExists();
    if (isExists) {
      Map<String, List<int>> devicesToRoomsMap =
          getInitializedDevicesToRoomsMap();
      final isRoomExists = devicesToRoomsMap.containsKey(roomName);
      if (isRoomExists) {
        List<int> devicesIdListForChosenRoom =
            devicesToRoomsMap[roomName] ?? [];
        devicesIdListForChosenRoom = devicesIdListForChosenRoom
                .contains(deviceId)
            ? devicesIdListForChosenRoom
            : devicesIdListForChosenRoom
          ..add(deviceId);
        devicesToRoomsMap[roomName] = devicesIdListForChosenRoom;
      } else {
        List<int> devicesIdListForChosenRoom = [deviceId];
        devicesToRoomsMap[roomName] = devicesIdListForChosenRoom;
      }
    }
  }

  @override
  bool isDevicesMapExists() {
    final bool isExists = _getStorage.hasData('initialized_devices');
    return isExists;
  }

  @override
  Future<void> createOrUpdateRoomInfo(Map<String, dynamic> json) async {
    final room = Room.fromJson(json);
    await _hestiaDB.createOrUpdateRoomInfo(room);
  }
}
