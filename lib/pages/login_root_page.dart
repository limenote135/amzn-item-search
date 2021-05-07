import 'package:amasearch/pages/login/login_page/login_page.dart';
import 'package:amasearch/pages/login/signup_page/signup_page.dart';
import 'package:amasearch/theme.dart';
import 'package:flutter/material.dart';

class LoginRootPage extends StatelessWidget {
  const LoginRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTheme.secondaryHeaderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, LoginPage.route());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 64),
              ),
              child: const Text("ログイン"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, SignupPage.route());
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 64),
              ),
              child: const Text("新規登録"),
            ),
          ],
        ),
      ),
    );
  }
}
