import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

const user = "Станислав Моисеев";
final DateTime dateTime = DateTime.now();

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key, //required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            userComponent(
                image: const AssetImage(
                  "assets/main/user_image.jpg",
                ),
                userName: user),
            const SizedBox(height: 25),
            roomImageComponent(const AssetImage('assets/main/kitchen.jpg'))
          ],
        ),
      )),
    );
  }

  Widget roomImageComponent(ImageProvider image) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 125,
        width: 170,
        decoration: BoxDecoration(image: DecorationImage(image: image)),
      ),
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
          InkWell(
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
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('EEEE, d MMMM', 'ru').format(dateTime).toTitleCase(),
                style: const TextStyle(
                    letterSpacing: 0.8,
                    fontFamily: "Lexend",
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: Color.fromARGB(255, 85, 85, 85)),
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
