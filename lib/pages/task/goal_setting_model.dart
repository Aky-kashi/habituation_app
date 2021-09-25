import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/firestore_date/goal.dart';
import 'package:habituation_coationg_app/firestore_date/task.dart';
import 'package:habituation_coationg_app/repository/goal_repository.dart';
import 'package:habituation_coationg_app/repository/task_repository.dart';

//注意すべき点 viewModelに変数やメソッドを全てにかく。

class GoalSettingModel with ChangeNotifier {
  //コンストラクタ

  GoalSettingModel() {
    init();
  }

  TextEditingController controller = TextEditingController();
  List<Task> taskList = [];
  bool done = false;
  bool ideal = true;
  //goalの扱いかたがわからない。イニシャライズをせよと言われているけれどどうすればいいかわからない。
  //Goal goal = ;
  //goalListは、自分で作らない方が良い。
  List<Goal> goalList = [];
  final now = DateTime.now();

  bool isChecked = false;

  Future<void> addTask() async {
    final tasks = Task(
        task: controller.text,
        done: done,
        time: now,
        ideal: ideal,
        goal: goalList.first,
        isChecked: isChecked);
    TaskRepository.addTask(tasks);
  }

  Future<void> callTask() async {
    taskList = await TaskRepository.fetchTaskList();
    notifyListeners();
  }

//条件trueになっているtaskを取ってくる。
  Future<void> trueTask() async {
    taskList = await TaskRepository.takeTrueTask();
    notifyListeners();
  }

  //initはいつ呼べばいいのか。GoalSettingModel() を作った時に呼べばいい。
  Future<void> init() async {
    goalList = await GoalRepository.fetchGoalList();
    taskList = await TaskRepository.fetchTaskList();
    notifyListeners();
  }
}
