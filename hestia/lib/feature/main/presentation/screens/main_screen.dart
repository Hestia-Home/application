import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/feature/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_smarthome/feature/main/presentation/bloc/main_bloc_states.dart';
import 'package:flutter_smarthome/feature/main/presentation/widgets/page_view_indicator.dart';
import 'package:flutter_smarthome/feature/main/presentation/widgets/room_view.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';

// Test data will be replaced soon

class MainScreen extends StatefulWidget {
  final MainBloc mainBloc;
  const MainScreen({super.key, required this.mainBloc});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _controller = PageController();
  @override
  void initState() {
    widget.mainBloc;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          leadingWidth: double.maxFinite,
          leading:
              BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
            if (state is PageLoadingState) {
              return Container();
            } else if (state is MainPageLoadedState) {
              return userComponent(
                  image: state.image ??
                      AssetImage('assets/main/empty_user_icon.jpg'),
                  userName: state.userEntity.name,
                  dateTime: state.currentDate);
            } else {
              return Container();
            }
          }),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child:
                BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
              if (state is PageLoadingState) {
                return Container();
              } else if (state is MainPageLoadedState) {
                return SingleChildScrollView(
                  child: PageViewIndicator(
                      roomsNames: state.roomList, controller: _controller),
                );
              } else if (state is MainPageErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              return Container();
            }),
          ),
        ),
        body: SafeArea(
          child: Center(child: BlocBuilder<MainBloc, MainBlocState>(
            builder: (context, state) {
              if (state is PageLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is MainPageLoadedState) {
                return PageView.builder(
                    controller: _controller,
                    itemCount: state.roomList.length,
                    itemBuilder: ((context, index) => SingleChildScrollView(
                            child: RoomView(
                          dataStream: state.deviceDataStream,
                          roomsNames: state.roomList[index],
                        ))));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
        ));
  }

  Widget userComponent(
      {required ImageProvider image,
      required String userName,
      required StreamController<DateTime> dateTime}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: image,
                  filterQuality: FilterQuality.high,
                )),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.8,
                    fontFamily: "Lexend",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              StreamBuilder<DateTime>(
                  stream: dateTime.stream,
                  builder: (context, snapshot) {
                    return Text(
                      DateFormat('EEEE, d MMMM', 'ru')
                          .format(snapshot.data ?? DateTime.now())
                          .toTitleCase(),
                      style: const TextStyle(
                          letterSpacing: 0.8,
                          fontFamily: "Lexend",
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 104, 104, 104)),
                    );
                  }),
            ],
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.black,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
