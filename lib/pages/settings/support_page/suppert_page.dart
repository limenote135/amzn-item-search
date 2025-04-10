import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/pages/settings/faq_page/faq_page.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:amasearch/util/device.dart';
import 'package:amasearch/util/support_info.dart';
import 'package:amasearch/util/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final _supportInfo = FutureProvider.autoDispose((_) async {
  final info = await SupportInfo().get();
  return info;
});

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

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
  const _Body();

  static final emailKey = GlobalKey<FormFieldState<String>>();
  static final asinKey = GlobalKey<FormFieldState<String>>();
  static final periodKey = GlobalKey<FormFieldState<String>>();
  static final contentKey = GlobalKey<FormFieldState<String>>();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mail = ref.watch(authStateChangesProvider).maybeWhen(
          data: (value) => value!.email,
          orElse: () => "",
        );
    final info = ref.watch(_supportInfo);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            info.when(
              error: (e, _) => Container(),
              loading: Container.new,
              data: (data) => ListTile(title: Text(data)),
            ),
            ListTile(
              title: Text.rich(
                TextSpan(
                  text: "お問い合わせの前に",
                  children: [
                    TextSpan(
                      text: "よくあるご質問",
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(context, FaqPage.route());
                        },
                    ),
                    const TextSpan(text: "もご確認ください"),
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text("回答メールが迷惑メールフォルダに分類されることがありますのでご注意ください。"),
            ),
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
                key: asinKey,
                decoration: const InputDecoration(
                  labelText: "発生しているASIN",
                  hintText: "発生しているASIN",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                key: periodKey,
                decoration: const InputDecoration(
                  labelText: "発生開始時期、発生頻度など",
                  hintText: "",
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
                  hintText: "どの画面でどのような操作を行ったかや、表示されたメッセージなど、なるべく具体的にお書きください",
                  hintMaxLines: 10,
                  alignLabelWithHint: true,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  final email = emailKey.currentState!.value!;
                  final content = contentKey.currentState!.value!;
                  final asin = asinKey.currentState?.value;
                  final period = periodKey.currentState?.value;

                  final info = await PackageInfo.fromPlatform();

                  final appVer = "Amasearch/${info.version}";
                  final device = await getDeviceInfo();

                  try {
                    await EasyLoading.show(status: '送信中...');
                    final fn = ref
                        .read(cloudFunctionProvider(functionNameSendSupport));
                    await fn.call<String>(<String, String>{
                      "mail": email,
                      "asin": asin ?? "",
                      "period": period ?? "",
                      "content": content,
                      "device": "$appVer $device",
                    });

                    // Loading アイコンがダイアログの上に重なって表示されるので、dismiss する
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
      ),
    );
  }
}
