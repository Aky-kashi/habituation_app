import 'package:flutter/material.dart';

class ControlModel with ChangeNotifier {
  int pageIndex = 0;

  void changeIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
