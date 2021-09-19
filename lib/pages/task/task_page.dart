import "package:flutter/material.dart";
import 'package:habituation_coationg_app/pages/home/enter.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  "目標の設定",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: const Text('今日の理想の目標を設定'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[300],
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
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: const Text('今日の最低限の取り組み'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[300],
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
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: const Text('達成状況'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[300],
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
  }
}
