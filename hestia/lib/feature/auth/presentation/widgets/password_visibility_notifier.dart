import 'package:flutter/material.dart';

class PasswordVisibilityState with ChangeNotifier {
  bool passwordVisibility = true;
  IconData visibilityIcon = Icons.visibility;
  void changeVisibility(bool newVisibilityValue, IconData newIcon) {
    passwordVisibility = newVisibilityValue;
    visibilityIcon = newIcon;
    notifyListeners();
  }
}
