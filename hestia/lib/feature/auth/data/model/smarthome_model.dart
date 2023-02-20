import 'package:flutter_smarthome/feature/auth/domain/entity/smarthome_entity.dart';

class SmarthomeModel extends SmarthomeEntity {
  const SmarthomeModel(
      {required super.homeName,
      required super.homeUniqueTag,
      required super.numberOfUsers});

  factory SmarthomeModel.fromJson(Map<String, dynamic> json) {
    return SmarthomeModel(
        homeName: json['homeName'],
        homeUniqueTag: json['homeUniqueTag'],
        numberOfUsers: json['numberOfUsers']);
  }

  Map<String, dynamic> toJson() {
    return {
      'homeName': homeName,
      'homeUniqueTag': homeUniqueTag,
      'numberOfUsers': numberOfUsers
    };
  }
}
