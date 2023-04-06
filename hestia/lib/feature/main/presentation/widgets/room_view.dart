import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/lighting_device_entity.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/temperature_sensor_entity.dart';

class RoomView extends StatelessWidget {
  final Stream dataStream;
  final String roomsNames;
  const RoomView(
      {super.key, required this.dataStream, required this.roomsNames});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: StreamBuilder(
            stream: dataStream,
            builder: (context, snapshot) {
              return GridView.builder(
                  cacheExtent: 200,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 185 / 240),
                  itemBuilder: (context, gridIndex) {
                    return _getCardWidget(snapshot.data.runtimeType);
                  });
            }),
      ),
    );
  }

  Widget _getCardWidget(Type type) {
    Widget cardWidget;
    switch (type) {
      case LightingDeviceEntity:
        cardWidget = Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
          color: const Color.fromARGB(255, 237, 237, 237),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 25, bottom: 20),
                child: Icon(
                  Icons.lightbulb_circle_rounded,
                  size: 45,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 65),
                child: Text(
                  "Устройство освещения",
                  style: TextStyle(
                      fontFamily: "Lexend",
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const Text(
                    "On",
                    style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Switch.adaptive(
                          value: false, onChanged: (bool newValue) {}),
                    ),
                  )
                ],
              )
            ],
          ),
        );
        return cardWidget;
      case TemperatureSensorEntity:
        cardWidget = Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 0,
            color: const Color.fromARGB(255, 237, 237, 237),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 25, bottom: 20),
                  child: Icon(
                    Icons.thermostat_auto,
                    size: 45,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 65),
                  child: Text(
                    "Датчик температуры",
                    style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "On",
                      style: TextStyle(
                          fontFamily: "Lexend",
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Switch.adaptive(
                                value: false, onChanged: (bool newValue) {})))
                  ],
                )
              ],
            ));
        return cardWidget;
      default:
        cardWidget = const Card();
    }
    return cardWidget;
  }
}
