// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/room_entity.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';

class PageViewIndicator extends StatelessWidget {
  ObservableStream<List<RoomEntity>> roomsNames;
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
          child: ObserverStream<List<RoomEntity>, Exception>(
            observableStream: () => roomsNames,
            onData: (_, data) => ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width / 11,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.jumpToPage(index);
                        // controller.page?.toInt();
                      },
                      child: Center(
                        child: Text(
                          data == null ? "" : data[index].name,
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
      ),
    );
  }
}
