import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'navigation_model.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NavigationModel(),
        child: Consumer<NavigationModel>(builder: (
          context,
          model,
          child,
        ) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('習慣化コーチングアプリ'),
              backgroundColor: Colors.amber,
            ),
            body: model.pages[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: (index) {
                model.changeIndex(index);
              },
              selectedItemColor: Colors.amber[800],
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'ホーム',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_bulleted),
                  label: '今日のタスク',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_sharp),
                  label: 'カレンダー',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_applications),
                  label: '設定',
                ),
              ],
            ),
          );
        }));
  }
}
