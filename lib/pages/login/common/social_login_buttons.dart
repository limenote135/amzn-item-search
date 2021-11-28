import 'dart:io';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/pages/login/common/sign_in_with_google.dart';
import 'package:amasearch/util/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'sign_in_with_apple.dart';

class SocialLoginButtons extends HookConsumerWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);

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
            try {
              await EasyLoading.show(status: 'loading...');
              final cred = await signInWithGoogle();
              if (cred == null) {
                // ログインキャンセルした場合などは何もしない
                return;
              }
              final fbCred = await auth.signInWithCredential(cred);

              final user = fbCred.user;
              if (user != null) {
                await Purchases.logIn(user.uid);
                await ref.read(analyticsControllerProvider).setUserId(user.uid);
              }

              Navigator.of(context).pop();
            } finally {
              await EasyLoading.dismiss();
            }
          },
        ),
        if (Platform.isIOS)
          SignInButton(
            Buttons.Apple,
            text: "AppleID でログイン",
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onPressed: () async {
              try {
                await EasyLoading.show(status: 'loading...');

                final cred = await signInWithApple();
                if (cred == null) {
                  return;
                }
                await auth.signInWithCredential(cred);
                final fbCred = await auth.signInWithCredential(cred);

                final user = fbCred.user;
                if (user != null) {
                  await Purchases.logIn(user.uid);
                  await ref
                      .read(analyticsControllerProvider)
                      .setUserId(user.uid);
                }

                Navigator.of(context).pop();
              } finally {
                await EasyLoading.dismiss();
              }
            },
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
                          url:
                              "https://amasearch.app.knz-c.com/terms/terms_of_service.txt",
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
                          url:
                              "https://amasearch.app.knz-c.com/terms/privacy_policy.txt",
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
