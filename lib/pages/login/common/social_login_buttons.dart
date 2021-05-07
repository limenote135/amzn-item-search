import 'dart:io';

import 'package:amasearch/util/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialLoginButtons extends HookWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = useProvider(firebaseAuthProvider);

    Future<UserCredential?> signInWithGoogle() async {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return auth.signInWithCredential(credential);
    }

    return Column(
      children: [
        const ListTile(
          title: Center(child: Text("または")),
        ),
        SignInButton(
          Buttons.Google,
          text: "Google でログイン",
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          onPressed: () async {
            final ret = await signInWithGoogle();
            if (ret == null) {
              // ログインキャンセルした場合などは何もしない
              return;
            }
            Navigator.of(context).pop();
          },
        ),
        if (Platform.isIOS)
          SignInButton(
            Buttons.Apple,
            text: "AppleID でログイン",
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onPressed: () {},
          ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: "続行すると、",
                children: [
                  TextSpan(
                    text: "利用規約",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await FlutterWebBrowser.openWebPage(
                          url: "https://www.google.co.jp",
                        );
                      },
                  ),
                  const TextSpan(text: " と "),
                  TextSpan(
                    text: "プライバシーポリシー",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await FlutterWebBrowser.openWebPage(
                          url: "https://www.yahoo.co.jp",
                        );
                      },
                  ),
                  const TextSpan(text: " に同意したことになります。"),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
