import 'package:flutter/material.dart';

class FirstModel with ChangeNotifier {
  int count = 0;

  void inclement() {
    count++;
    notifyListeners();
  }
}
