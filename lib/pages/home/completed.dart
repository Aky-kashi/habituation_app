import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/firestore_date/goal.dart';
import 'package:provider/provider.dart';

import 'completed_model.dart';
import 'home_page.dart';

class CompletedPage extends StatelessWidget {
  //コンストラクタを設定する際には、変数を設定する必要がある。
  //StatelessWidgetの変数は変更することを許されないのでfinalをつける。
  //コンストラクタに

  //値が欲しい時は、窓口を作る。
  // コンストラクタを作って、引数を受け取る。
  // 変数名は新たに作っても良い。
  //変数名はnullを許さないのでrequiredをかく。
  // String?にするとrequiredはいらない。

  //Goal形に変更する必要がある。
  final Goal goals;

  const CompletedPage({Key? key, required this.goals}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CompletedModel(), //CompletedModel()が作られている。作られたタイミングでinitメソッドも呼ばれている。
      child: Consumer<CompletedModel>(builder: (
        context,
        model,
        child,
      ) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: ListView(padding: EdgeInsets.all(16), children: [
            Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shadowColor: Colors.orange[300],
                        elevation: 8,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.orange),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  '習慣化したいタスク',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Center(
                                child: Text(
                                  goals.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              //この書き方だとリストで取ってきてしまうので、よくない。
                              //欲しい習慣化タスクだけを特定してもってきたい。
                              //直前の登録したタスクを取ってきたい。
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shadowColor: Colors.orange[300],
                        elevation: 8,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.orange),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  '習慣化によって達成したいこと',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Center(
                                child: Text(
                                  goals.goal,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shadowColor: Colors.orange[300],
                        elevation: 8,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.orange),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  '取り組む日時',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Center(
                                child: Text(
                                  goals.time,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 180.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: const Text('SNSで共有'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          /* ShareProvider()
                      .shareImageAndText('test', convertWidgetToImageKey);*/
                        },
                      ),
                      ElevatedButton(
                        child: const Text('一覧へ戻る'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
      }),
    );
  }
}
