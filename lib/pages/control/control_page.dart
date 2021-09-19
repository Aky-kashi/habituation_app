import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'control_model.dart';

class Control extends StatelessWidget {
  const Control({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ControlModel(),
        child: Consumer<ControlModel>(builder: (
          context,
          model,
          child,
        ) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('習慣化コーチングアプリ'),
              backgroundColor: Colors.amber,
            ),
            body: Center(
                //hild: _widgetOptions.elementAt(_selectedIndex),
                ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.amber[800],
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'ホーム',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_flags),
                  label: '習慣目標',
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
              currentIndex: model.pageIndex,
              onTap: model.changeIndex,
            ),
          );
        }));
  }
}
