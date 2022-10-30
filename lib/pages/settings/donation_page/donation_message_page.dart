import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/cloud_functions.dart';
import 'package:amasearch/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final _currentPackageProvider =
    Provider<Package>((_) => throw UnimplementedError());

class DonationMessagePage extends ConsumerWidget {
  const DonationMessagePage({super.key});
  static const String routeName = "/settings/donation/settings";

  static Route<void> route(Package package) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [_currentPackageProvider.overrideWithValue(package)],
        child: const DonationMessagePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package = ref.watch(_currentPackageProvider);
    return Scaffold(
      appBar: AppBar(title: Text(package.storeProduct.title)),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  static final emailKey = GlobalKey<FormFieldState<String>>();
  static final nameKey = GlobalKey<FormFieldState<String>>();
  static final messageKey = GlobalKey<FormFieldState<String>>();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package = ref.watch(_currentPackageProvider);
    final auth = ref.watch(firebaseAuthProvider);

    Future<void> sendDonation(
      String email,
      String name,
      String message,
      String date,
    ) async {
      final fn = ref.read(cloudFunctionProvider(functionNameSendDonation));
      await fn.call<String>(<String, String>{
        "item": package.storeProduct.title,
        "price": package.storeProduct.priceString,
        "date": date,
        "mail": email,
        "name": name,
        "message": message,
      });
    }

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "ごちそうするとお礼のメッセージと使い道の写真が届きます",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            ListTile(
              title: Text(package.storeProduct.title),
              trailing: Text(package.storeProduct.priceString),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                key: emailKey,
                validator: emailOrEmptyValidator,
                controller:
                    TextEditingController(text: auth.currentUser?.email),
                decoration: const InputDecoration(
                  label: Text("お礼の連絡先(任意)"),
                  hintText: "メールアドレス(任意)",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "お礼のメッセージと使い道の写真の送り先です",
                  style: Theme.of(context).textTheme.caption,
                  // textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                key: nameKey,
                decoration: const InputDecoration(
                  hintText: "おなまえ または TwitterID(任意)",
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "TwitterIDを入れると、お礼のリプライが届きます",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                key: messageKey,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 3,
                decoration: const InputDecoration(hintText: "メッセージ(任意)"),
              ),
            ),
            ElevatedButton(
              child: const Text("ごちそうする"),
              onPressed: () async {
                if (formKey.currentState?.validate() != true) {
                  return;
                }
                final mail = emailKey.currentState!.value ?? "";
                final name = nameKey.currentState!.value ?? "";
                final message = messageKey.currentState!.value ?? "";
                try {
                  await EasyLoading.show(status: "処理中...");
                  final info = await Purchases.purchasePackage(package);

                  await sendDonation(mail, name, message, info.requestDate);

                  await EasyLoading.dismiss();
                  await showOkAlertDialog(
                    context: context,
                    title: "ごちそうさまです！",
                    message: "数日以内にお礼と使い道の写真をお送りします。",
                  );

                  Navigator.pop(context);
                } on PlatformException catch (e) {
                  final code = PurchasesErrorHelper.getErrorCode(e);
                  switch (code) {
                    case PurchasesErrorCode.purchaseCancelledError:
                      // キャンセルした場合
                      return;
                    case PurchasesErrorCode.paymentPendingError:
                      // この時点ではペンディングされている
                      // 購入成功と同じ扱いにする
                      await sendDonation(mail, name, message, "pending");
                      await EasyLoading.dismiss();
                      await showOkAlertDialog(
                        context: context,
                        title: "ごちそうさまです！",
                        message: "数日以内にお礼と使い道の写真をお送りします。",
                      );
                      Navigator.pop(context);
                      return;
                    // ignore: no_default_cases
                    default:
                      await EasyLoading.dismiss();
                      await showOkAlertDialog(
                        context: context,
                        title: "決済できませんでした",
                        message: e.message,
                      );
                      rethrow;
                  }
                } finally {
                  if (EasyLoading.isShow) {
                    await EasyLoading.dismiss();
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

String? emailOrEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return emailValidator(value);
}
