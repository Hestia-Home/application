import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String userid;
  final bool isLoggedIn;

  const UserEntity(
      {required this.name, required this.userid, required this.isLoggedIn});

  @override
  List<Object?> get props => [name, userid, isLoggedIn];
}
