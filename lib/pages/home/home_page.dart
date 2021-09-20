import "package:flutter/material.dart";
import 'package:habituation_coationg_app/pages/home/completed.dart';
import 'package:provider/provider.dart';

import 'completed_model.dart';
import 'enter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CompletedModel(),
        //CompletedModel()が作られている。作られたタイミングでinitメソッドも呼ばれている。
        child: Consumer<CompletedModel>(builder: (
          context,
          model,
          child,
        ) {
          //streambuilderはデータベースから値を取っていないときに使う。リアルタイムで更新することができる。
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.goalList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Card(
                                    shadowColor: Colors.black,
                                    elevation: 8,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue[300]),
                                        padding: EdgeInsets.all(16),
                                        child: ListTile(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return CompletedPage(
                                                      //押した値だけを取りに行きたい。
                                                      //ListViewbuilderによってボタンを押したところの値を取ってこれる。
                                                      goals:
                                                          model.goalList[index],
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            title: Center(
                                              child: Text(
                                                model.goalList[index].title,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )))),
                              ),
                            ],
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('新規追加'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Enter();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
