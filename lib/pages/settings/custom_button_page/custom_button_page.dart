import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'url_settings_page.dart';

class CustomButtonPage extends StatelessWidget {
  const CustomButtonPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/custom_button";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CustomButtonPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("カスタムボタン設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    return ListView.builder(
      itemCount: settings.customButtons.length,
      itemBuilder: (BuildContext context, int index) {
        final button = settings.customButtons[index];
        return ListTile(
          title: Text(button.title),
          trailing: Switch(
            value: button.enable,
            onChanged: (value) {
              final updated = [
                for (var i = 0; i < settings.customButtons.length; i++)
                  i == index
                      ? settings.customButtons[i].copyWith(enable: value)
                      : settings.customButtons[i]
              ];
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(customButtons: updated);
            },
          ),
          onTap: () async {
            final button = await Navigator.push(
              context,
              UrlSettingsPage.route(settings.customButtons[index]),
            );

            if (button == null) {
              return;
            }

            final updated = [
              for (var i = 0; i < settings.customButtons.length; i++)
                i == index
                    ? settings.customButtons[i].copyWith(
                        title: button.title,
                        pattern: button.pattern,
                      )
                    : settings.customButtons[i]
            ];
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(customButtons: updated);
          },
        );
      },
    );
  }
}
