import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkModeon = false;

  void updateTheme(bool isDarkModeon) {
    this.isDarkModeon = isDarkModeon;
    notifyListeners();
  }
}