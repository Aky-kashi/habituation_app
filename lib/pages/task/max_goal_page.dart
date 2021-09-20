import "package:flutter/material.dart";

import 'goal_setting.dart';

class MaxGoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 300.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "今日の理想の目標を設定しましょう",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('タスク選択'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[300],
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return GoalSetting();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ])))),
    );
  }
}
