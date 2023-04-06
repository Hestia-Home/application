import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.name, required super.isLoggedIn});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], isLoggedIn: json['json']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'isLoggedIn': isLoggedIn};
  }
}
