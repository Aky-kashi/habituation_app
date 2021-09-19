import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/firestore_date/goal.dart';
import 'package:habituation_coationg_app/repository/goal_repository.dart';

class CompletedModel with ChangeNotifier {
  //コンストラクタ（
  CompletedModel() {
    init();
  }

  List<Goal> goalList = [];

  //initはいつ呼べばいいのか。ComletedModelを作った時に呼べばいい。
  Future<void> init() async {
    goalList = await GoalRepository.fetchGoalList();
    notifyListeners();
  }
}
