import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionTextPage extends StatelessWidget {
  const ConditionTextPage({super.key});
  static const String routeName = "/settings/condition_description";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ConditionTextPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("コンディション説明設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);

    final captionStyle = captionFontSize(context);
    final middleSize = middleFontSize(context);

    return ListView(
      children: [
        ListTile(
          title: Text(
            "選択したものが既定のコンディション説明になります",
            style: captionStyle,
          ),
        ),
        const ThemeDivider(),
        ListTile(
          title: Text("新品コンディション", style: captionStyle),
        ),
        for (var i = 0; i < settings.newConditionTexts.length; i++)
          RadioListTile(
            value: i,
            groupValue: settings.newConditionTextIndex,
            title: Text(
              settings.newConditionTexts[i],
              style: middleSize,
            ),
            secondary: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final result = await showTextInputDialog(
                  context: context,
                  textFields: [
                    DialogTextField(
                      initialText: settings.newConditionTexts[i],
                      maxLines: 5,
                    ),
                  ],
                );
                if (result == null || result.isEmpty) {
                  return;
                }
                final newTexts = [
                  for (var n = 0; n < settings.newConditionTexts.length; n++)
                    n == i ? result[0] : settings.newConditionTexts[n],
                ];
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .update(newConditionTexts: newTexts);
              },
            ),
            onChanged: (value) {
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(newConditionTextIndex: i);
            },
          ),
        const ThemeDivider(),
        ListTile(
          title: Text("中古コンディション", style: captionStyle),
        ),
        for (var i = 0; i < settings.usedConditionTexts.length; i++)
          RadioListTile(
            value: i,
            groupValue: settings.usedConditionTextIndex,
            title: Text(
              settings.usedConditionTexts[i],
              style: middleSize,
            ),
            secondary: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final result = await showTextInputDialog(
                  context: context,
                  textFields: [
                    DialogTextField(
                      initialText: settings.usedConditionTexts[i],
                      maxLines: 5,
                    ),
                  ],
                );
                if (result == null || result.isEmpty) {
                  return;
                }
                final newTexts = [
                  for (var n = 0; n < settings.usedConditionTexts.length; n++)
                    n == i ? result[0] : settings.usedConditionTexts[n],
                ];
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .update(usedConditionTexts: newTexts);
              },
            ),
            onChanged: (value) {
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(usedConditionTextIndex: i);
            },
          ),
      ],
    );
  }
}
