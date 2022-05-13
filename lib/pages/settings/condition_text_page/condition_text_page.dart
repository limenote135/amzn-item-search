import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConditionTextPage extends StatelessWidget {
  const ConditionTextPage({Key? key}) : super(key: key);
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
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);

    final captionStyle = Theme.of(context).textTheme.caption;
    final smallSize = Theme.of(context).textTheme.bodyText2;

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
              style: smallSize,
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
                settings.newConditionTexts[i] = result[0];
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .update(newConditionTexts: settings.newConditionTexts);
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
              style: smallSize,
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
                settings.usedConditionTexts[i] = result[0];
                ref
                    .read(generalSettingsControllerProvider.notifier)
                    .update(usedConditionTexts: settings.usedConditionTexts);
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
