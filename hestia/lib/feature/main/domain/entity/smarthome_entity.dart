import 'package:equatable/equatable.dart';

class SmarthomeEntity extends Equatable {
  final String homeName;
  final String homeUniqueTag;
  final int numberOfUsers;
  const SmarthomeEntity(
      {required this.homeName,
      required this.homeUniqueTag,
      required this.numberOfUsers});

  @override
  List<Object?> get props => [homeName, homeUniqueTag, numberOfUsers];
}
