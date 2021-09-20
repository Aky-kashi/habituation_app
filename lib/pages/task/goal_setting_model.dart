import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/firestore_date/task.dart';
import 'package:habituation_coationg_app/repository/task_repository.dart';

//注意すべき点 viewModelに変数やメソッドを全てにかく。

class GoalSettingModel with ChangeNotifier {
  //コンストラクタ

  GoalSettingModel() {
    init();
  }
  TextEditingController controller = TextEditingController();

  Future<void> addTask() async {
    /*final tasks = Task(
        task: controller.text,
        done: done,
        time: time,
        ideal: ideal,
        goal: goal);
    TaskRepository.addTask(tasks);*/
  }

  List<Task> taskList = [];

  //initはいつ呼べばいいのか。GoalSettingModel() を作った時に呼べばいい。
  Future<void> init() async {
    taskList = await TaskRepository.fetchTaskList();
    notifyListeners();
  }
}
