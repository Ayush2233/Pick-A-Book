import 'package:flutter/material.dart';

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkModeon = false;

  void updateTheme(bool isDarkModeon) {
    this.isDarkModeon = isDarkModeon;
    notifyListeners();
  }
}