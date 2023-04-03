import 'package:flutter/material.dart';
import 'package:flutter_smarthome/feature/main/presentation/widgets/page_view_indicator.dart';
import 'package:flutter_smarthome/feature/main/presentation/widgets/room_view.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';

// Test data will be replaced soon
const user = "Станислав Моисеев";
final DateTime dateTime = DateTime.now();
const List<String> rooms = [
  "Кухня",
  "Спальня 1",
  "Гостинная",
  "Спальня 2",
  "Спальня 4",
  "Спальня 3"
];

class MainScreen extends StatefulWidget {
  late final controller = PageController();
  MainScreen({
    super.key, //required this.image
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        leadingWidth: double.maxFinite,
        leading: userComponent(
            image: const AssetImage(
              "assets/main/user_image.jpg",
            ),
            userName: user),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: SingleChildScrollView(
            child: PageViewIndicator(
                roomsNames: rooms, controller: widget.controller),
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: PageView.builder(
            controller: widget.controller,
            itemCount: rooms.length,
            itemBuilder: ((context, index) =>
                const SingleChildScrollView(child: RoomView()))),
      )),
    );
  }

  Widget userComponent({
    required ImageProvider image,
    required String userName,
  }) {
    initializeDateFormatting();
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
              Text(
                DateFormat('EEEE, d MMMM', 'ru').format(dateTime).toTitleCase(),
                style: const TextStyle(
                    letterSpacing: 0.8,
                    fontFamily: "Lexend",
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: Color.fromARGB(255, 104, 104, 104)),
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
