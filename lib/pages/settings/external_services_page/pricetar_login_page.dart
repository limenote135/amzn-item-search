import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/repository/pricetar.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/secure_storage.dart';
import 'package:amasearch/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PricetarLoginSettings extends StatelessWidget {
  const PricetarLoginSettings({super.key});

  static const String routeName = "/settings/external_services/pricetar/login";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PricetarLoginSettings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プライスターログイン設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulHookConsumerWidget {
  const _Body();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyState();
}

class _BodyState extends ConsumerState {
  static final idKey = GlobalKey<FormFieldState<String>>();
  static final passwordKey = GlobalKey<FormFieldState<String>>();
  static final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final storage = ref.read(secureStorageProvider);
    storage.read(key: "pricetarID").then((value) {
      idKey.currentState?.didChange(value);
    });
    storage.read(key: "pricetarPassword").then((value) {
      passwordKey.currentState?.didChange(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pwController = useTextEditingController();
    final pwFocusNode = useFocusNode();

    Future<void> onSubmit() async {
      if (formKey.currentState?.validate() != true) {
        return;
      }
      final id = idKey.currentState!.value;
      final pass = passwordKey.currentState!.value;
      final storage = ref.read(secureStorageProvider);
      await storage.write(key: "pricetarID", value: id);
      await storage.write(key: "pricetarPassword", value: pass);
    }

    return SingleChildScrollView(
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
                  child: TextFormField(
                    key: idKey,
                    decoration: const InputDecoration(
                      hintText: "ユーザーID",
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    validator: notEmptyValidator,
                    onFieldSubmitted: (_) => pwFocusNode.requestFocus(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    key: passwordKey,
                    controller: pwController,
                    focusNode: pwFocusNode,
                    decoration: const InputDecoration(
                      hintText: "パスワード",
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    obscureText: true,
                    validator: notEmptyValidator,
                    onFieldSubmitted: (_) => onSubmit(),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: loginTest,
                  child: const Text("テスト"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text("保存"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loginTest() async {
    final repo = ref.read(pricetarProvider);
    if (formKey.currentState?.validate() != true) {
      return;
    }
    final id = idKey.currentState!.value;
    final pass = passwordKey.currentState!.value;
    if (id == null || id.isEmpty || pass == null || pass.isEmpty) {
      return;
    }
    try {
      final resp = await repo.login(id, pass);
      await showOkAlertDialog(
        context: context,
        title: "ログイン結果",
        message: resp.message,
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e, st) {
      await recordError(e, st, information: const ["Pricetar login test"]);
      await showOkAlertDialog(
        context: context,
        title: "エラー",
        message: "ログインに失敗しました",
      );
    }
  }
}
