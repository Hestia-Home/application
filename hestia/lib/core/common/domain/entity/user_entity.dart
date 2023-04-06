import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final bool isLoggedIn;

  const UserEntity({required this.name, required this.isLoggedIn});

  @override
  List<Object?> get props => [name, isLoggedIn];
}
