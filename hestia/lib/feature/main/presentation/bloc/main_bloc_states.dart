import 'package:equatable/equatable.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_socket_stream_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_user_avatar_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_user_usecase.dart';

abstract class MainBlocState extends Equatable {}

class InitState extends MainBlocState {
  @override
  List<Object?> get props => [];
}

// Shows progress indicator while loading user's data
class PageLoadingState extends MainBlocState {
  final GetUserUsecase getUser;
  final GetUserAvatarUsecase getAvatar;

  PageLoadingState(this.getUser, this.getAvatar);

  @override
  List<Object?> get props => [getUser, getAvatar];
}

// Shows progress indicator while listning to events and waiting for data from devices
// Works for the first run, when no devices had been initialized and cached yet and when new event has been registered in stream
class DevicesLoadingState extends MainBlocState {
  final GetSocketStreamUsecase getSocketStream;

  DevicesLoadingState(this.getSocketStream);

  @override
  List<Object?> get props => [getSocketStream];
}

class MainPageLoadedState extends MainBlocState {
  //TODO: implement this and all other states
  @override
  List<Object?> get props => [];
}
