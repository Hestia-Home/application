import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final int id;
  final String name;

  const RoomEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
