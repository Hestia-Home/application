import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/core/di/service_locator.dart';
import 'package:flutter_smarthome/core/navigation/app_router/app_router.gr.dart';
import 'package:flutter_smarthome/feature/main/presentation/screens/main_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runZonedGuarded<void>(
    _run,
    (error, stackTrace) async {
      dev.log('Unexpected error: $error\n$stackTrace');
    },
  );
}

_run() {
  runApp(BlocProvider.value(
    value: AuthServiceLocator.i.authCubit,
    child: AuthServiceLocator.i.myApp,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(
        appBarStore: MainServiceLocator.i.appBarStore,
        mainStore: MainServiceLocator.i.mainStore,
      ),
      debugShowCheckedModeBanner: false,
    );
    // BlocProvider.of<ServiceLocator.i.authCubit>(context).navigateToAuthPages();
    // return MaterialApp.router(
    //   routerDelegate: appRouter.delegate(),
    //   routeInformationParser: appRouter.defaultRouteParser(),
    //   debugShowCheckedModeBanner: false,
    //);
  }
}
