import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/theme.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/input_field.dart';
import '../common/social_login_buttons.dart';

class SignupPage extends HookWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const routeName = "/login/signup";

  static Route<void> route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const SignupPage());
  }

  @override
  Widget build(BuildContext context) {
    final emailKey = GlobalKey<FormFieldState<String>>();
    final passwordKey = GlobalKey<FormFieldState<String>>();
    final formKey = GlobalKey<FormState>();

    final pwController = useTextEditingController();
    final pw2Controller = useTextEditingController();

    final pwFocusNode = useFocusNode();
    final pw2FocusNode = useFocusNode();

    final auth = useProvider(firebaseAuthProvider);

    Future<void> _onSubmit() async {
      if (formKey.currentState?.validate() ?? false) {
        final email = emailKey.currentState!.value;
        final password = passwordKey.currentState!.value;
        try {
          final userCredential = await auth.createUserWithEmailAndPassword(
            email: email!,
            password: password!,
          );
          print(userCredential);
          Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
          var msg = "不明なエラー";
          switch (e.code) {
            case "weak-password":
              msg = "パスワードが短すぎます";
              break;
            case "email-already-in-use":
              msg = "このメールアドレスは既に使われています";
              break;
            case "invalid-email":
              msg = "不正なメールアドレスです";
              break;
            case "operation-not-allowed":
              msg = "操作が許可されていません";
              break;
            default:
              msg = e.code;
              break;
          }
          await showOkAlertDialog(
            context: context,
            title: "エラー",
            message: msg,
          );
        }
      }
      pwController.clear();
      pw2Controller.clear();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightTheme.secondaryHeaderColor,
      ),
      backgroundColor: lightTheme.secondaryHeaderColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: EmailFormField(
                        fieldKey: emailKey,
                        onSubmit: (_) => pwFocusNode.requestFocus(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: PasswordFormField(
                        fieldKey: passwordKey,
                        controller: pwController,
                        focusNode: pwFocusNode,
                        inputAction: TextInputAction.next,
                        onSubmit: (_) => pw2FocusNode.requestFocus(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: PasswordFormField(
                        controller: pw2Controller,
                        focusNode: pw2FocusNode,
                        hintText: "パスワードの確認",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "パスワードを再度入力してください";
                          }
                          if (passwordKey.currentState?.value != value) {
                            return "パスワードが一致しません";
                          }
                          return null;
                        },
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
                  child: const Text("新規登録"),
                ),
              ),
              const ThemeDivider(),
              const SocialLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
