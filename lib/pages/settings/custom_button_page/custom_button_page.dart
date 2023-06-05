import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/general_settings_default.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/widgets/payment.dart';
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

    final smallStrongText = smallFontSize(context)!.merge(strongTextStyle);

    final isPaidUser = ref.watch(isPaidUserProvider);

    var itemCount = settings.customButtons.length + standardButtonLength;
    if (!isPaidUser) {
      // 無料会員向けにカスタムボタンは4つまでしか表示されない旨を表示するため
      itemCount++;
    }

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int indexRaw) {
        var index = indexRaw;
        if (!isPaidUser) {
          index--;
        }
        if (!isPaidUser && indexRaw == 0) {
          return ListTile(
            title: Text(
              "フリープランではカスタムボタンは4つまでしか利用できません",
              style: smallStrongText,
            ),
          );
        }
        if (index < standardButtonLength) {
          final key = standardButtonKeys[index];
          return ListTile(
            leading: _leadingIconMargin,
            title: _StandardButtonTitle(title: key),
            trailing: Switch(
              value: standardButtons[key]!,
              onChanged: (value) async {
                if (value &&
                    key == standardButtonVariationPageKey &&
                    !isPaidUser) {
                  await showUnpaidDialog(context);
                  return;
                }
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
            onChanged: (value) async {
              final updated = [
                for (var i = 0; i < settings.customButtons.length; i++)
                  i == buttonIndex
                      ? settings.customButtons[i].copyWith(enable: value)
                      : settings.customButtons[i]
              ];
              final enableCount = settings.customButtons
                  .where((element) => element.enable)
                  .toList()
                  .length;
              if (value && enableCount > 3 && !isPaidUser) {
                await showUnpaidDialog(
                  context,
                  message: "フリープランではカスタムボタンは4つまでしか指定できません。",
                );
                return;
              }
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(customButtons: updated);
            },
          ),
          onTap: () async {
            final button = await Navigator.push(
              context,
              UrlSettingsPage.route(settings.customButtons[buttonIndex]),
            );

            if (button == null) {
              return;
            }

            final updated = [
              for (var i = 0; i < settings.customButtons.length; i++)
                i == buttonIndex
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

class _StandardButtonTitle extends StatelessWidget {
  const _StandardButtonTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    switch (title) {
      case standardButtonAmazonListKey:
        return const Text("出品一覧");
      case standardButtonNewOffersKey:
        return const Text("新品一覧");
      case standardButtonUsedOffersKey:
        return const Text("中古一覧");
      case standardButtonKeepaPageKey:
        return const Text("Keepa");
      case standardButtonVariationPageKey:
        return const WithLockIconIfNotPaid(child: Text("バリエーション"));
    }
    return const Text("不明");
  }
}
