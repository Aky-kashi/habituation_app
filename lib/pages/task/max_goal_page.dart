import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'goal_setting.dart';
import 'goal_setting_model.dart';

class MaxGoalPage extends StatelessWidget {
  const MaxGoalPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoalSettingModel(),
        child: Consumer<GoalSettingModel>(builder: (
          context,
          model,
          child,
        ) {
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
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.taskList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SizedBox(
                                        height: 100,
                                        width: 300,
                                        child: Card(
                                            shadowColor: Colors.black,
                                            elevation: 8,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue[300]),
                                                padding: EdgeInsets.all(16),
                                                child: ListTile(
                                                  title: Center(
                                                      child: Text(
                                                    model.taskList[index].task,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                                ))))),
                              ]);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                child: const Text('タスク選択'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue[400],
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
        }));
  }
}
