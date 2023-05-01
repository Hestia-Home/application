import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/core/common/domain/entity/user_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_devices_to_rooms_map_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_main_page_list_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_socket_stream_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_user_avatar_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/get_user_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/is_devices_map_exists_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/is_main_page_list_exists_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/save_user_avatar_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/set_devices_map.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/set_main_page_list_usecase.dart';
import 'package:flutter_smarthome/feature/main/domain/usecase/set_user_usecase.dart';
import 'package:flutter_smarthome/feature/main/presentation/bloc/main_bloc_events.dart';
import 'package:flutter_smarthome/feature/main/presentation/bloc/main_bloc_states.dart';

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  final GetSocketStreamUsecase getSocketStream;
  final GetUserAvatarUsecase getUserAvatar;
  final GetUserUsecase getUser;
  final SaveUserAvatarUsecase saveUserAvatar;
  final SetUserUsecase setUser;
  final Stream<List<Device>> deviceDataStream;
  final IsMainPageListExistsUsecase isMainPageListExists;
  final SetMainPageListUsecase setMainPageList;
  final GetDevicesToRoomsMapUsecase getDevicesToRooms;
  final GetMainPageListUsecase getMainPageList;
  final SetDevicesMapUsecase setDevicesMap;
  final IsDevicesMapExistsUsecase isDevicesMapExists;
  late List<String> roomList;
  late final StreamController<DateTime> currentDate;

  MainBloc(
      {required this.isDevicesMapExists,
      required this.setDevicesMap,
      required this.getDevicesToRooms,
      required this.isMainPageListExists,
      required this.setMainPageList,
      required this.getMainPageList,
      required this.getSocketStream,
      required this.getUserAvatar,
      required this.getUser,
      required this.saveUserAvatar,
      required this.setUser})
      : deviceDataStream = getSocketStream.call().asBroadcastStream(),
        super(const InitState()) {
    /// Initialising `roomList`
    ///
    /// If instance of this list does not exists inside `GetStorage` than we initialize `List` with  `Неопределенные устройства (Unassigned devices)` value
    ///
    /// This list is used to create pages for each room initialized by user

    final bool isExists = isMainPageListExists.call();
    roomList = isExists
        ? getMainPageList.call()
        : roomList = ["Неопределенные устройства"];

    /// Initializing `Stream` of `DateTime` values, which used to show current date and day of the week in AppBar on MainPage
    ///
    /// If newDate != firstDate new events is not added to StreamController, so StreamBuilder will not be rebuilding every second

    DateTime firstDate = DateTime.now();
    currentDate = StreamController();
    currentDate.add(firstDate);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime newDate = DateTime.now();
      if (newDate.day > firstDate.day) {
        currentDate.add(newDate);
        firstDate = newDate;
      }
    });

    /// Main business logic for data processing
    ///
    /// First initializes required variables to pass to `MainPageLoadedState` constructor, than emit `State`

    on<MainBlocEvent>((event, emit) async {
      if (event is PageLoadingEvent) {
        emit(const PageLoadingState());

        // TODO: Add real userEntity integration
        // final UserEntity user = await getUser.call();

        // !!! TEMPORARY DATA FOR TESTING !!!
        const UserEntity _user =
            UserEntity(name: "Станислав Моисеев", isLoggedIn: true);
        // final Map<String, List<int>> initializedDevicesToRoomsMap = getDevicesToRooms.call();
        final Map<String, List<int>> initializedDevicesToRoomsMap = {
          "Unuassigned": [1]
        };
        final List<String> roomsList = ["Неопределенные устройства"];
        final ImageProvider? image = AssetImage(
            'assets/main/user_image.jpg'); //await getUserAvatar.call();

        emit(MainPageLoadedState(
            userEntity: _user,
            currentDate: currentDate,
            roomList: roomsList,
            initializedDeivcesToRoomsMap: initializedDevicesToRoomsMap,
            image: image,
            deviceDataStream: deviceDataStream));
      }
    });
  }

  void logOut() {
    //TODO: add LogOut usecase and logOut method to RemoteDataSource and LocalDataSource in auth feature
  }

  void deleteRoom(int index) {
    roomList.removeAt(index);
    setMainPageList.call(roomList);
  }

  void addNewRoom(String roomName) {
    if (!roomList.contains(roomName)) {
      roomList.add(roomName);
      setMainPageList.call(roomList);
    }
  }

  void addNewUserAvatar() async {
    await saveUserAvatar.call();
    add(const PageLoadingEvent());
  }
}
