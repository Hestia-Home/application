import 'package:flutter_smarthome/feature/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.name, required super.userid, required super.isLoggedIn});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], userid: json['userid'], isLoggedIn: json['json']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'userid': userid, 'isLoggedIn': isLoggedIn};
  }
}
