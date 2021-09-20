import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/pages/task/goal_setting_model.dart';
import 'package:provider/provider.dart';

class GoalSetting extends StatelessWidget {
  const GoalSetting({
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
            body: ListView(padding: EdgeInsets.all(16), children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Text(
                    "目標の設定",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Column(children: [
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shadowColor: Colors.black,
                        elevation: 8,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[300],
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              TextFormField(
                                controller: model.controller,
                                decoration: const InputDecoration(
                                    hintText: '目標を記入してください。',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.taskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Card(
                                shadowColor: Colors.black,
                                elevation: 8,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.blue[300]),
                                    padding: EdgeInsets.all(16),
                                    child: ListTile(
                                        title: Center(
                                      child: Text(
                                        model.taskList[index].task,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )))),
                          ),
                        ],
                      );
                    }),
              ])
            ]),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ));
      }),
    );
  }
}
