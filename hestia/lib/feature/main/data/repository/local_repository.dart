import 'dart:io' as io;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/local_data_source/i_local_data_source.dart';
import 'package:flutter_smarthome/feature/main/domain/repository/i_local_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
