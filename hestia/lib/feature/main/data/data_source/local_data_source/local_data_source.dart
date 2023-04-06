import 'dart:convert';
import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/core/common/data/model/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataSource implements ILocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final GetStorage _getStorage;

  const LocalDataSource(this._secureStorage, this._getStorage);

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
}
