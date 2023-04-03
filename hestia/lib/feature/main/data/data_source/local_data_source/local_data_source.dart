import 'dart:convert';
import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/core/common/data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataSource implements ILocalDataSource {
  final FlutterSecureStorage secureStorage;

  const LocalDataSource(this.secureStorage);

  @override
  Future<UserEntity> getUser() async {
    final userData = await secureStorage.read(key: 'user') ?? '';
    final UserEntity user = UserModel.fromJson(jsonDecode(userData));
    return user;
  }

  @override
  Future<void> setUser(
      {required String userName,
      required String userId,
      required bool isLoggedIn}) async {
    final String userModel =
        UserModel(name: userName, userid: userId, isLoggedIn: isLoggedIn)
            .toJson()
            .toString();
    await secureStorage.write(key: 'user', value: userModel);
  }

  @override
  Future<void> saveUserAvatarImage() async {
    final userImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final path = (await getApplicationDocumentsDirectory()).path;
    if (userImage != null) userImage.saveTo("$path/avatar.jpg");
  }

  @override
  Future<Image> getUserAvatarImage() async {
    final String path = (await getApplicationDocumentsDirectory()).path;
    final bool isFileExists = io.File("$path/avatar.jpg").existsSync();
    late final Image image;
    if (isFileExists) image = Image.file(File("$path/avatar.jpg"));
    return image;
  }
}
