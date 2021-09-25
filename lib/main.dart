import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habituation_coationg_app/pages/navigation_page/navigation_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//Firebase Authincetace.currentUser == null
//nullだった場合はログインページに飛ばしたい。

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        /* title: "HabitBoddy",
        debugShowCheckedModeBanner: false,
        home: (currentUser != null) ? */
        home: Navigation() /*: LoginPage())*/);
  }
}
