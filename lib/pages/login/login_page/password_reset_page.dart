import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/pages/login/common/input_field.dart';
import 'package:amasearch/theme.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});
  static const routeName = "/login/reset";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PasswordResetPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  static final formKey = GlobalKey<FormState>();
  static final fieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onSubmit() async {
      if (formKey.currentState?.validate() != true) {
        return;
      }
      final ret = await showOkCancelAlertDialog(
        context: context,
        title: "パスワードのリセット",
        message: "パスワードをリセットしますか？",
      );
      final email = fieldKey.currentState!.value!;
      if (ret == OkCancelResult.ok) {
        try {
          await EasyLoading.show(status: '送信中...');
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

          // Loading アイコンがダイアログの上に重なって表示されるので、dismiss する
          await EasyLoading.dismiss();
          await showOkAlertDialog(
            context: context,
            title: "パスワードのリセット",
            message: "パスワードリセットメールを送信しました",
          );
          Navigator.pop(context);
        } on FirebaseAuthException catch (e, stack) {
          var msg = "不明なエラー";
          switch (e.code) {
            case "invalid-email":
              msg = "不正なメールアドレスです";
            case "user-disabled":
              msg = "このユーザーは無効化されているか既に退会しています";
            case "user-not-found":
              msg = "ユーザーが見つかりませんでした";
            default:
              await recordError(
                e,
                stack,
                information: [
                  "SignInWithEmailAndPassword error",
                  "Code: ${e.code}",
                ],
              );
              msg = e.code;
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
                      fieldKey: fieldKey,
                      autoFocus: true,
                      onSubmit: (_) => onSubmit(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                    ),
                    onPressed: onSubmit,
                    child: const Text("パスワードをリセット"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
