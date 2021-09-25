import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habituation_coationg_app/firestore_date/task.dart';

/// ここでCRUD処理をまとめていきたい。
///
///質問①：GoalRepositoryと書き方が違う。
///       get ref =>としている理由は、一番下で、addTask関数を設定をするためなのか。
///       GoalRepositoryの方はlocalである。

///質問②：get ref =>の書き方があまり馴染みがない。
///       CollectionReference ref =  FirebaseFirestore.instance…と同じ意味を示すのか。
///
/// 処理をしているわけではないので、関数のように書かなくてもよい。
/// 中で重たい処理をするのなら、
/// getterにアクセスする場合は、重たい処理ではないことを明示するため。
class TaskRepository {
  static CollectionReference<Map<String, dynamic>> get ref =>
      //ref()
      FirebaseFirestore.instance
          .collection('users')
          .doc('adBHnzOKJ6jELKpDXgmV')
          .collection('tasks');

  /// Userのタスクデータを全権取得するメソッド
  static Future<List<Task>> fetchTaskList() async {
    /// tasks コレクションのコレクションリファレンスがほしい。
    ///実体化することができる。
    final snapshot = await ref.get();

    // mapの説明
    // [docA, docB, docC]
    // 今回でいうところの e という変数に、docA, docB, docC が順番に入ってくる。
    // 順番に入ってきて、こちらが指定した処理が順番に適用される。
    // こちらが指定した処理というのは、今回で言うと doc を Task クラスに変換するって処理。
    // 順番に入ってきたやつを List としてまた作り直すことができるのがおもしろい。
    // [docA, docB, docC] -> [TaskA, TaskB, TaskC] こういうふうにマッピングすることができてハッピー。

    ///QueryDocumentSnapshot型をList型に変更する。
    final list =
        Future.wait(snapshot.docs.map((e) => Task.fromFirestore(e)).toList());
    return list;
  }

  static Future<void> addTask(Task task) async {
    ///新しい追加されたuserの情報をtoMapとして持っている。
    ref.add(task.toMap());
  }

  //isCheckedのfalseをtrueに変える。
  static Future changeIsChecked() async {
    DocumentReference document = FirebaseFirestore.instance
        .collection('users')
        .doc('adBHnzOKJ6jELKpDXgmV')
        .collection('tasks')
        .doc('jyVBmKvBANbgTAlfTQDi');

    return await document.update({'isChecked': true});
  }

  //isCheckedがtrueのtaskを取ってくる。
  static Future takeTrueTask() async {
    final trueTask = FirebaseFirestore.instance;
    trueTask
        .collection('users')
        .doc('adBHnzOKJ6jELKpDXgmV')
        .collection('tasks')
        .where('isChecked', isEqualTo: true)
        .get();
  }
}
