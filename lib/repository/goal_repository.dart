import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habituation_coationg_app/firestore_date/goal.dart';

/// ここでCRUD処理をまとめていきたい。
class GoalRepository {
  /// UserのGoalデータを全権取得するメソッド
  ///

  //新たにこの変数を作るのは違う気がする。
  final firestore = FirebaseFirestore.instance;

  //コレクション名は複数形にしといた方が良い。
  static CollectionReference<Map<String, dynamic>> get ref =>
      FirebaseFirestore.instance
          .collection('users')
          .doc('B1DuerjVzvPCxNTs5SpR')
          .collection('goals');

  static Future<List<Goal>> fetchGoalList() async {
    ///現在のログインしているユーザのデータを取ってきたい。
    final user = FirebaseAuth.instance.currentUser;

    ///上記のままでは使えないので、.get()をして実体化させる。
    final snapshot = await ref.get();

    final list = snapshot.docs.map(Goal.fromFirestore).toList();
    return list;
  }

  //firebaseに値を追加する。
  //toMapの形で新しいgoalのref情報を加えるよと言うこと。
  static Future<void> addGoal(Goal goal) async {
    ref.add(goal.toMap());
  }
}
