import 'package:amasearch/pages/login/login_page/login_page.dart';
import 'package:amasearch/pages/login/signup_page/signup_page.dart';
import 'package:amasearch/theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

// 基準とするデバイスの幅
const _baseWidth = 400;
// baseWidth に大してどれくらいの大きさでロゴを作っているか
const _baseScale = 2;
const _minScale = 1.5;

class LoginRootPage extends StatelessWidget {
  const LoginRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ratio = _baseWidth / width * _baseScale;
    final scale = ratio < _minScale ? _minScale : ratio;
    return Scaffold(
      backgroundColor: lightTheme.secondaryHeaderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: ExtendedImage.asset(
                "assets/title.png",
                scale: scale,
              ),
            ),
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
