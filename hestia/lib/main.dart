import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/core/di/service_locator.dart';
import 'package:flutter_smarthome/core/navigation/auth/app_router.gr.dart';
import 'feature/auth/presentation/bloc/auth_cubit.dart';

void main() {
  runApp(BlocProvider.value(
    value: ServiceLocator.i.authCubit,
    child: ServiceLocator.i.myApp,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).navigateToAuthPages();
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
