import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/pages/login/common/validators.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/support";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SupportPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("問い合わせ"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  static final emailKey = GlobalKey<FormFieldState<String>>();
  static final contentKey = GlobalKey<FormFieldState<String>>();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mail = ref.watch(authStateChangesProvider).maybeWhen(
          data: (value) => value!.email,
          orElse: () => "",
        );
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              key: emailKey,
              initialValue: mail,
              validator: emailValidator,
              decoration: const InputDecoration(
                labelText: "メールアドレス",
                hintText: "メールアドレス",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              key: contentKey,
              minLines: 4,
              maxLines: null,
              validator: notEmptyValidator,
              decoration: const InputDecoration(
                labelText: "問い合わせ内容",
                hintText: "内容",
                alignLabelWithHint: true,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                final email = emailKey.currentState!.value!;
                final content = contentKey.currentState!.value!;
                try {
                  await EasyLoading.show(status: '送信中...');
                  final fn =
                      ref.read(cloudFunctionProvider(functionNameSendSupport));
                  await fn.call<String>(<String, String>{
                    "mail": email,
                    "content": content,
                  });

                  await EasyLoading.dismiss();
                  await showOkAlertDialog(
                    context: context,
                    message: "問い合わせを受け付けました。数日以内に返信いたします。",
                  );
                  Navigator.pop(context);
                } finally {
                  if (EasyLoading.isShow) {
                    await EasyLoading.dismiss();
                  }
                }
              }
            },
            child: const Text("送信"),
          ),
        ],
      ),
    );
  }
}
