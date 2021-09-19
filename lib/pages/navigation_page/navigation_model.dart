import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/pages/calender/calender.dart';
import 'package:habituation_coationg_app/pages/home/home_page.dart';
import 'package:habituation_coationg_app/pages/setting/setting.dart';
import 'package:habituation_coationg_app/pages/task/task_page.dart';

class NavigationModel with ChangeNotifier {
  List<Widget> pages = [
    HomePage(),
    TaskPage(),
    CalenderPage(),
    SettingPage(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
