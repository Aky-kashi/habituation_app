//stateless

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'first_model.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FirstModel(),
        child: Consumer<FirstModel>(builder: (
          context,
          model,
          child,
        ) {
          return Scaffold(
            body: Center(
              child: Text(
                '${model.count}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: model.inclement,
              child: null,
            ),
          );
        }));
  }
}
