import 'package:flutter/material.dart';

class HomeModel with ChangeNotifier {
  int pageIndex = 0;
  final taskTitle = [];

  void changeIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }

/*  addCard(String inputtext) {
    counter++;
    taskTitle .add({"title": inputtext});
    print(items);
    notifyListeners();
  }*/

}
