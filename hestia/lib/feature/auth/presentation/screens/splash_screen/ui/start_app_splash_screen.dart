import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smarthome/core/di/service_locator.dart';
import 'package:flutter_smarthome/core/navigation/auth/app_router.gr.dart';
import 'package:flutter_smarthome/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:flutter_smarthome/feature/auth/presentation/bloc/auth_cubit_states.dart';
import 'package:transparent_image/transparent_image.dart';

class StartAppSplashScreen extends StatelessWidget {
  StartAppSplashScreen({super.key});
  final loginUsecase = ServiceLocator.i.loginUsecase;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      BlocProvider.of<AuthCubit>(context).navigateToAuthPages();

      if (ServiceLocator.i.authCubit.state is AuthBiometricsState) {
        AutoRouter.of(context).push(
          const SplashRouter(),
        );
      } else if (ServiceLocator.i.authCubit.state is AuthSignInState) {
        AutoRouter.of(context).push(
            const AuthRouter(children: [RegistrationRoute(), AuthRoute()]));
      }
    });
    return Scaffold(
      body: Center(
        child: FadeInImage.memoryNetwork(
            fadeInDuration: const Duration(seconds: 3),
            height: 205,
            width: 225,
            image: "https://i.ibb.co/B49F7B4/Group-32.png",
            placeholder: kTransparentImage),
      ),
    );
  }
}
