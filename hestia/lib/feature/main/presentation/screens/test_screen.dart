import 'package:flutter/material.dart';
import 'package:flutter_smarthome/feature/main/data/data_source/remote_data_source/remote_data_source.dart';

class TestScreen extends StatelessWidget {
  final int a;
  TestScreen({super.key, this.a = 5});
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  @override
  // Screen for testing WebSocket connection
  // Will be removed in future
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: remoteDataSource.temperatureStream,
            builder: (context, snapshot) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.hasData ? snapshot.data!.roomName : '0'),
                    Text(snapshot.hasData ? '${snapshot.data!.sensorId}' : '0'),
                    Text(snapshot.hasData
                        ? '${snapshot.data!.temperature}'
                        : '0')
                  ],
                )),
      ),
    );
  }
}
