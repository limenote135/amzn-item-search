import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/general_settings_default.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'url_settings_page.dart';

class CustomButtonPage extends StatelessWidget {
  const CustomButtonPage({super.key});
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

const _leadingIconMargin = SizedBox(width: 30);

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    final standardButtons = settings.standardButtons;
    final standardButtonLength = standardButtons.length;
    final standardButtonKeys = standardButtons.keys.toList();
    return ListView.builder(
      itemCount: settings.customButtons.length + standardButtonLength,
      itemBuilder: (BuildContext context, int index) {
        if (index < standardButtonLength) {
          final key = standardButtonKeys[index];
          return ListTile(
            leading: _leadingIconMargin,
            title: Text(_getButtonTitle(key)),
            trailing: Switch(
              value: standardButtons[key]!,
              onChanged: (value) {
                final newValue = <String, bool>{};
                standardButtons.forEach((k, v) {
                  if (k == key) {
                    newValue[k] = value;
                  } else {
                    newValue[k] = v;
                  }
                });
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .update(standardButtons: newValue);
              },
            ),
          );
        }
        final buttonIndex = index - settings.standardButtons.length;
        final button = settings.customButtons[buttonIndex];
        return ListTile(
          leading: const Icon(Icons.settings),
          title: Text(button.title),
          trailing: Switch(
            value: button.enable,
            onChanged: (value) {
              final updated = [
                for (var i = 0; i < settings.customButtons.length; i++)
                  i == buttonIndex
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

String _getButtonTitle(String key) {
  switch (key) {
    case standardButtonAmazonListKey:
      return "出品一覧";
    case standardButtonNewOffersKey:
      return "新品一覧";
    case standardButtonUsedOffersKey:
      return "中古一覧";
    case standardButtonKeepaPageKey:
      return "Keepa";
    case standardButtonVariationPageKey:
      return "バリエーション";
  }
  return "不明";
}
