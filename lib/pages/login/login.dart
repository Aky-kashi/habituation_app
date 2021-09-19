import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:habituation_coationg_app/pages/login/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginModel(),
        child: Consumer<LoginModel>(builder: (
          context,
          model,
          child,
        ) {
          return Padding(
            padding: const EdgeInsets.only(top: 500.0),
            child: Column(
              children: [
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () async {
                    await model.signInWithGoogle();
                    if (model.google_login == true) {
                      print('ログイン成功');
                    } else {
                      print('ログイン失敗');
                    }
                  },
                ),
                SignInButton(
                  Buttons.Apple,
                  text: "Sign up with Apple",
                  onPressed: () async {
                    await model.signInWithApple();
                    if (model.apple_login == true) {
                      print('ログイン成功');
                    } else {
                      print('ログイン失敗');
                    }
                  },
                ),
              ],
            ),
          );
        }));
  }
}
