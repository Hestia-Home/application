import 'package:flutter/material.dart';
import 'package:flutter_smarthome/feature/auth/domain/usecase/log_in_by_biometrics.dart';
import 'package:flutter_smarthome/feature/auth/presentation/widgets/auth_widgets.dart';

class AuthSplashScreen extends StatelessWidget {
  const AuthSplashScreen({Key? key, required this.loginUsecase})
      : super(key: key);
  final LoginUsecase loginUsecase;
  @override
  Widget build(BuildContext context) {
    () async => await loginUsecase.loginByBiometrics();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            backgroundShape(double.maxFinite - 20, double.maxFinite - 20),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 235,
                width: 220,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/auth/rect.png"))),
              ),
            ),
            Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: authLogoGroup(300, 305)),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Easily Control\nYour Home",
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Manage your home from anytime,\nanywhere.",
                  style: TextStyle(
                      fontSize: 21,
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 112, 121, 126)),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
