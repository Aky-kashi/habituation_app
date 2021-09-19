import 'package:cloud_firestore/cloud_firestore.dart';

//エンティティ
class Goal {
  /*タイトル*/
  final String title;

  /*目標*/
  final String goal;

  /*取り組む時間*/
  final String time;

  final DocumentReference? ref;

  const Goal({
    required this.title,
    required this.goal,
    required this.time,
    this.ref,
  });

  factory Goal.fromMap(Map<String, dynamic> map) {
    return new Goal(
      title: map['title'],
      goal: map['goal'],
      time: map['time'],

      //ref: map['ref'],
    );
  }

  //

  ///このメソッドの目的は、Goalクラスにref情報をもたすと言う目的で作った。

  static Goal fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    //Firestoreのdocumentから全てのデータを取ってくる。
    final map = doc.data()!;
    //Goalの全てのデータをfromMapする。
    final goal = Goal.fromMap(map); // これで goal は作れる。けれども ref情報がない。
    // goal.ref = doc.reference; // こうしたいなあと思う。けれども finalだから更新できない。
    final goalWithRef = goal.copyWith(ref: doc.reference); // copyWithを使えば更新できる。
    // goalWithRef っていうのは ref情報をちゃんと持ってる Goal クラスになった。
    return goalWithRef;
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'goal': this.goal,
      'time': this.time,
      'ref': this.ref,
    };
  }

  Goal copyWith({
    String? title,
    String? goal,
    String? time,
    String? place,
    DocumentReference? ref,
  }) {
    return Goal(
      title: title ?? this.title,
      goal: goal ?? this.goal,
      time: time ?? this.time,
      ref: ref ?? this.ref,
    );
  }
}
