import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/core/di/service_locator.dart';
import 'package:flutter_smarthome/core/navigation/app_router/app_router.gr.dart';
import 'package:flutter_smarthome/feature/main/presentation/bloc/main_bloc_events.dart';
import 'package:flutter_smarthome/feature/main/presentation/screens/main_screen.dart';
import 'feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
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
    MainServiceLocator.i.mainBloc.add(PageLoadingEvent());
    return MaterialApp(
      home: BlocProvider.value(
        value: MainServiceLocator.i.mainBloc,
        child: MainScreen(mainBloc: MainServiceLocator.i.mainBloc),
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
