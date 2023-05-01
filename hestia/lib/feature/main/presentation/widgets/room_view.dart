import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/feature/main/data/model/lighting_device_model.dart';
import 'package:flutter_smarthome/feature/main/data/model/sensor_model.dart';
import 'package:flutter_smarthome/feature/main/domain/entity/device.dart';

class RoomView extends StatelessWidget {
  final Stream<List<Device>> dataStream;
  final String roomsNames;
  const RoomView(
      {super.key, required this.dataStream, required this.roomsNames});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: StreamBuilder<List<Device>>(
            stream: dataStream,
            builder: (context, snapshot) {
              return GridView.builder(
                  itemCount: snapshot.data?.length,
                  cacheExtent: 200,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 185 / 240),
                  itemBuilder: (context, gridIndex) {
                    return _getCardWidget(snapshot.data?[gridIndex]);
                  });
            }),
      ),
    );
  }

  Widget _getCardWidget(dynamic data) {
    Map<dynamic, Widget> map = {
      TemperatureSensorModel: _temperatureSensorCard(data),
      LightingDeviceModel: _lightingDeviceCard(data)
    };
    return map[data.runtimeType] ??
        const Card(
          color: Colors.blue,
        );
  }

  Widget _lightingDeviceCard(dynamic lightingDeviceEntity) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
              "Освещение",
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
  }

  Widget _temperatureSensorCard(dynamic temperatureSensorEntity) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        color: const Color.fromARGB(255, 237, 237, 237),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 25, bottom: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ImageIcon(
                    AssetImage('assets/main/thermostat.png'),
                    size: 45,
                  )),
            ),
            const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Температура",
                  style: TextStyle(
                      fontFamily: "Lexend",
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: Text(temperatureSensorEntity.temperature.toString())),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "On",
                    style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
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
  }
}
