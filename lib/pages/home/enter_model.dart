import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/firestore_date/goal.dart';
import 'package:habituation_coationg_app/repository/goal_repository.dart';

//注意すべき点 viewModelに変数やメソッドを全てにかく。

class EnterModel with ChangeNotifier {
  List<TextEditingController> controller =
      List.generate(3, (i) => TextEditingController());

  Future<void> addGoal() async {
    final goals = Goal(
      title: controller[0].text,
      goal: controller[1].text,
      time: controller[2].text,
    );
    GoalRepository.addGoal(goals);
  }
}
