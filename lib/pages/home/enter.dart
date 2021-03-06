import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/firestore_date/goal.dart';
import 'package:provider/provider.dart';

import 'Completed.dart';
import 'enter_model.dart';

class Enter extends StatelessWidget {
  const Enter({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EnterModel(),
      child: Consumer<EnterModel>(builder: (
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
                "習慣化したいことを設定しましょう。",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Column(
            children: [
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
                            Text(
                              '習慣化したいことは何ですか?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: model.controller[0],
                              decoration: const InputDecoration(
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
                            Text(
                              'それによって達成したいことは何ですか?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: model.controller[1],
                              decoration: const InputDecoration(
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
                            Text(
                              'いつ取り組みますか?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: model.controller[2],
                              decoration: const InputDecoration(
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
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                          child: const Text('記入終了'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  //goalを渡せばいい。

                                  return CompletedPage(
                                      goals: Goal(
                                    title: model.controller[0].text,
                                    goal: model.controller[1].text,
                                    time: model.controller[2].text,
                                  )); //model.controller[0].text);
                                },
                              ),
                            );

                            //wearと言うメソッドがある。

                            //Firebaseに値を追加する。
                            //関数を呼ぶ行為ができていない。
                            model.addGoal();
                          })))
            ],
          ),
        ]));
      }),
    );
  }
}
