import 'package:flutter/material.dart';

Widget backgroundShape(double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/auth/background_shape.png"),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high)),
  );
}

Widget authLogoGroup(double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage("assets/auth/auth_group.png"),
      fit: BoxFit.cover,
    )),
  );
}

Widget pageBackground() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade50],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft)),
  );
}

Widget logo(double height, double width) {
  return Stack(children: [
    Center(
      child: Container(
        height: height * 0.85,
        width: width * 0.8,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/auth/rect.png"))),
      ),
    ),
    Center(child: authLogoGroup(height, width))
  ]);
}
