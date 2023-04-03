// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  List<String> roomsNames;
  PageController controller;
  PageViewIndicator(
      {super.key, required this.roomsNames, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.center,
          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width / 11,
                  ),
              scrollDirection: Axis.horizontal,
              itemCount: roomsNames.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller.jumpToPage(index);
                      // controller.page?.toInt();
                    },
                    child: Center(
                      child: Text(
                        roomsNames[index],
                        style: TextStyle(
                            fontFamily: "Lexend",
                            fontSize: 2 == index ? 17 : 15,
                            color: 2 == index
                                ? Colors.black
                                : const Color.fromARGB(255, 104, 104, 104),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
