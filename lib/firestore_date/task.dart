import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habituation_coationg_app/firestore_date/goal.dart';

class Task {
  /*タスク名*/
  final String task;
  /*取り組んだか否か*/
  final bool done;
  /*取り組んだ時間*/
  //後で、Timestamp形に変更する必要がある。
  final DateTime time;
  /*理想のタスクか否か*/
  final bool ideal;

  //自分のref情報
  final DocumentReference? ref;

  final Goal goal;

  const Task({
    required this.task,
    required this.done,
    required this.time,
    required this.ideal,
    this.ref,
    required this.goal,
  });

  static Future<Task> fromMap(Map<String, dynamic> map) async {
    //goalRefと言うのを作りたい。
    //実体になっていない。
    //
    final goalRef = map['goalRef'] as DocumentReference<Map<String, dynamic>>;
    // 実体が手に入る=>['goalRefを使うことができる。']
    final snapshot = await goalRef.get();

    final goal =
        Goal.fromFirestore(snapshot); // refからgoalが作れた！=>goalRefからgoalを作れた。

    return Task(
      task: map['task'],
      done: map['done'],
      time: map['time'],
      ideal: map['ideal'],
      goal: map['goal'],
      // この情報は map には含まれていないので取れないのでコメントアウト
      //ref: map['ref'],
    );
  }

  ///このメソッドの目的は、Taskクラスにref情報をもたすと言う目的で作った。
  static Future<Task> fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) async {
    //Firestoreのdocumentから全てのデータを取ってくる。
    final map = doc.data()!;
    // これで task は作れる。けれども ref情報がない。
    final task = await Task.fromMap(map);
    // task.ref = doc.reference; // こうしたいなあと思う。けれども finalだから更新できない。
    final taskWithRef = task.copyWith(ref: doc.reference); // copyWithを使えば更新できる。
    // taskWithRef っていうのは ref情報をちゃんと持ってる Task クラスになった。
    return taskWithRef;
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'task': this.task,
      'done': this.done,
      'time': this.time,
      'ideal': this.ideal,
      'ref': this.ref,
      'goal': this.goal,
    };
  }

  Task copyWith({
    String? task,
    bool? done,
    DateTime? time,
    bool? ideal,
    DocumentReference? ref,
    Goal? goal,
  }) {
    return Task(
      task: task ?? this.task,
      done: done ?? this.done,
      time: time ?? this.time,
      ideal: ideal ?? this.ideal,
      ref: ref ?? this.ref,
      goal: goal ?? this.goal,
    );
  }

//</editor-fold>

}
