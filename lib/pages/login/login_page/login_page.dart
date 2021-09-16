import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/pages/login/login_page/password_reset_page.dart';
import 'package:amasearch/theme.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/input_field.dart';
import '../common/social_login_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = "/login/login";

  static Route<void> route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightTheme.secondaryHeaderColor,
      ),
      backgroundColor: lightTheme.secondaryHeaderColor,
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  static final emailKey = GlobalKey<FormFieldState<String>>();
  static final passwordKey = GlobalKey<FormFieldState<String>>();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pwController = useTextEditingController();
    final pwFocusNode = useFocusNode();

    final auth = ref.watch(firebaseAuthProvider);

    Future<void> _onSubmit() async {
      if (formKey.currentState?.validate() ?? false) {
        final email = emailKey.currentState!.value!;
        final password = passwordKey.currentState!.value!;
        try {
          await EasyLoading.show(status: 'loading...');

          final cred = await auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          if (cred.user?.emailVerified == false) {
            await cred.user?.sendEmailVerification();
            await EasyLoading.dismiss();
            await showOkAlertDialog(
              context: context,
              title: "メールアドレスの確認",
              message: "メールアドレスの確認がされていません。このまま確認できない場合、一定期間後にアカウントが無効化されます。",
            );
          }

          await ref.read(analyticsControllerProvider).setUserId(cred.user?.uid);

          Navigator.pop(context);
        } on FirebaseAuthException catch (e, stack) {
          var msg = "不明なエラー";
          switch (e.code) {
            case "invalid-email":
              msg = "不正なメールアドレスです";
              break;
            case "user-disabled":
              msg = "このユーザーは既に退会しています";
              break;
            case "user-not-found":
              msg = "ユーザーが見つかりませんでした";
              break;
            case "wrong-password":
              msg = "メールアドレスかパスワードが違います";
              break;
            default:
              await recordError(e, stack, information: [
                "SignInWithEmailAndPassword error",
                "Code: ${e.code}",
              ]);
              msg = e.code;
              break;
          }
          // Loading アイコンがダイアログの上に重なって表示されるので、dismiss する
          await EasyLoading.dismiss();
          await showOkAlertDialog(
            context: context,
            title: "エラー",
            message: msg,
          );
        } finally {
          if (EasyLoading.isShow) {
            await EasyLoading.dismiss();
          }
        }
      }
      pwController.clear();
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: EmailFormField(
                      fieldKey: emailKey,
                      onSubmit: (_) => pwFocusNode.requestFocus(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: PasswordFormField(
                      fieldKey: passwordKey,
                      controller: pwController,
                      focusNode: pwFocusNode,
                      onSubmit: (_) => _onSubmit(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                ),
                onPressed: _onSubmit,
                child: const Text("ログイン"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(PasswordResetPage.route());
              },
              child: const Text(
                "パスワードを忘れた場合",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const ThemeDivider(),
            const SocialLoginButtons(),
          ],
        ),
      ),
    );
  }
}
