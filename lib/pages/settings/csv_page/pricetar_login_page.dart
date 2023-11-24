import 'package:amasearch/util/secure_storage.dart';
import 'package:amasearch/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PricetarLoginSettings extends StatelessWidget {
  const PricetarLoginSettings({super.key});
  static const String routeName = "/settings/csv/pricetar/login";

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

class _Body extends HookConsumerWidget {
  const _Body();

  static final idKey = GlobalKey<FormFieldState<String>>();
  static final passwordKey = GlobalKey<FormFieldState<String>>();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          ElevatedButton(onPressed: onSubmit, child: const Text("保存")),
        ],
      ),
    );
  }
}
