import 'dart:io';

import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/pages/login/common/sign_in_with_google.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/error_report.dart';
import 'sign_in_with_apple.dart';

class SocialLoginButtons extends HookConsumerWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              final user = cred.user;
              if (user != null) {
                await Future.wait([
                  Purchases.logIn(user.uid),
                  FirebaseCrashlytics.instance.setUserIdentifier(user.uid),
                  ref.read(analyticsControllerProvider).setUserId(user.uid),
                ]);
              }

              Navigator.of(context).pop();
              // ignore: avoid_catches_without_on_clauses
            } catch (e, stack) {
              await recordError(e, stack, information: const ["Google SignIn"]);
            } finally {
              await EasyLoading.dismiss();
            }
          },
        ),
        if (Platform.isIOS)
          SignInButton(
            Buttons.Apple,
            text: "Apple でログイン",
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onPressed: () async {
              try {
                await EasyLoading.show(status: 'loading...');

                final cred = await signInWithApple();
                if (cred == null) {
                  return;
                }

                final user = cred.user;
                if (user != null) {
                  await Future.wait([
                    Purchases.logIn(user.uid),
                    FirebaseCrashlytics.instance.setUserIdentifier(user.uid),
                    ref.read(analyticsControllerProvider).setUserId(user.uid),
                  ]);
                }

                Navigator.of(context).pop();
                // ignore: avoid_catches_without_on_clauses
              } catch (e, stack) {
                await recordError(
                  e,
                  stack,
                  information: const ["SignInWithApple"],
                );
                rethrow;
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
                        await launchUrl(
                          Uri.parse(
                            "https://amasearch.knz-c.com/terms/terms_of_service.txt",
                          ),
                          mode: LaunchMode.inAppBrowserView,
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
                        await launchUrl(
                          Uri.parse(
                            "https://amasearch.knz-c.com/terms/privacy_policy.txt",
                          ),
                          mode: LaunchMode.inAppBrowserView,
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
