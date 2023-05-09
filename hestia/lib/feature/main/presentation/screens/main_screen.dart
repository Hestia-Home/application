// ignore_for_file: depend_on_referenced_packages
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_smarthome/feature/main/presentation/mobx/main/appbar_store.dart';
import 'package:flutter_smarthome/feature/main/presentation/mobx/main/main_store.dart';
import 'package:flutter_smarthome/feature/main/presentation/widgets/page_view_indicator.dart';
import 'package:flutter_smarthome/feature/main/presentation/widgets/room_view.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MainScreen extends StatefulWidget {
  final MainStore mainStore;
  final AppBarStore appBarStore;
  const MainScreen(
      {super.key, required this.mainStore, required this.appBarStore});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    widget.mainStore;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarStore = widget.appBarStore;
    final mainStore = widget.mainStore;
    initializeDateFormatting();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          leadingWidth: double.maxFinite,
          leading: ObserverStream<DateTime, Exception>(
              observableStream: () => appBarStore.dateStream,
              onData: (_, data) => _userComponent(appBarStore: appBarStore)),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Observer(
                builder: (context) {
                  if (mainStore.isErrorState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(mainStore.errorMessage)));
                    });
                  } else if (mainStore.isEmptyState) {
                    return Center(
                        child: Shimmer(
                            child: Container(color: Colors.blueGrey.shade200)));
                  } else {
                    return SingleChildScrollView(
                      child: PageViewIndicator(
                          roomsNames: mainStore.roomsListStream,
                          controller: _controller),
                    );
                  }
                  return const SizedBox();
                },
              )),
        ),
        body: SafeArea(
          child: Center(child: Observer(
            builder: (context) {
              if (mainStore.isEmptyState) {
                return const CircularProgressIndicator();
              } else if (!mainStore.isErrorState && !mainStore.isEmptyState) {
                return PageView.builder(
                    controller: _controller,
                    itemCount: mainStore.roomsListStream.value!.length,
                    itemBuilder: ((context, index) => SingleChildScrollView(
                            child: RoomView(
                          dataStream: mainStore.devicesStream,
                        ))));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: 'Главная'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.black,
                  size: 40,
                ),
                label: 'Добавить'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart_outlined_rounded,
                  size: 30,
                ),
                label: 'Статистика'),
          ],
        )
        // ConvexAppBar(
        //   items:
        //   curve: Curves.easeInCirc,
        //   backgroundColor: Colors.transparent,
        //   shadowColor: const Color.fromARGB(255, 205, 203, 203),
        //   activeColor: Color.fromARGB(255, 137, 133, 133),

        // ),
        );
  }

  Widget _userComponent({required AppBarStore appBarStore}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ObserverFuture<ImageProvider, Exception>(
                observableFuture: () => appBarStore.image,
                fetchData: () => appBarStore.getUserAvatar(),
                onData: (context, data) => Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: data,
                    filterQuality: FilterQuality.high,
                  )),
                ),
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
              Observer(
                builder: (context) => Text(
                  appBarStore.user.value!.name,
                  style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.8,
                      fontFamily: "Lexend",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ObserverStream<DateTime, Exception>(
                observableStream: () => appBarStore.dateStream,
                onData: (context, data) => Text(
                  DateFormat('EEEE, d MMMM', 'ru')
                      .format(data ?? DateTime.now())
                      .toTitleCase(),
                  style: const TextStyle(
                      letterSpacing: 0.8,
                      fontFamily: "Lexend",
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 104, 104, 104)),
                ),
              ),
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
