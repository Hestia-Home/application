import 'package:flutter/material.dart';
import '../screens/main_screen.dart';

class RoomView extends StatelessWidget {
  //final Stream dataStream;
  //final String roomName;
  const RoomView({
    super.key, //required this.dataStream, required this.roomName
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: GridView.builder(
          cacheExtent: 200,
          itemCount: rooms.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 185 / 240),
          itemBuilder: (context, gridIndex) => Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 0,
            color: const Color.fromARGB(255, 237, 237, 237),
            child: Center(
                child: Text(
              rooms[gridIndex],
              style: const TextStyle(fontSize: 15),
            )),
          ),
        ),
      ),
    );
  }
}
