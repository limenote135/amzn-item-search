import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/pages/settings/read_aloud_page/pattern_settings_page.dart';
import 'package:amasearch/pages/settings/read_aloud_page/slider_tile.dart';
import 'package:amasearch/util/text_to_speech.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReadAloudSettingsPage extends StatelessWidget {
  const ReadAloudSettingsPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/read_aloud";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ReadAloudSettingsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("読み上げ設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(generalSettingsControllerProvider);
    final tts = useProvider(ttsProvider);
    return ListView(
      children: [
        SwitchListTile(
          title: const Text("音声読み上げを有効にする"),
          value: settings.enableReadAloud,
          onChanged: (value) {
            context
                .read(generalSettingsControllerProvider.notifier)
                .update(enableReadAloud: value);
            if (value) {
              context.read(analyticsControllerProvider).setUserProp(
                  readAloudPropName,
                  settings.readAloudPatterns[settings.patternIndex].pattern);
            } else {
              context
                  .read(analyticsControllerProvider)
                  .setUserProp(readAloudPropName, "");
            }
          },
        ),
        const ThemeDivider(),
        for (var i = 0; i < settings.readAloudPatterns.length; i++)
          RadioListTile<int>(
            value: i,
            groupValue: settings.patternIndex,
            title: Text(settings.readAloudPatterns[i].title),
            subtitle: Text(settings.readAloudPatterns[i].pattern),
            secondary: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  PatternSettingsPage.route(
                      settings.readAloudPatterns[i].pattern),
                ).then((value) {
                  if (value == null) {
                    return;
                  }

                  final updatedPattern = [
                    for (var index = 0;
                        index < settings.readAloudPatterns.length;
                        index++)
                      i == index
                          ? settings.readAloudPatterns[index]
                              .copyWith(pattern: value)
                          : settings.readAloudPatterns[index],
                  ];

                  context
                      .read(generalSettingsControllerProvider.notifier)
                      .update(patterns: updatedPattern);

                  if (settings.enableReadAloud && i == settings.patternIndex) {
                    context.read(analyticsControllerProvider).setUserProp(
                        readAloudPropName,
                        settings.readAloudPatterns[i].pattern);
                  }
                });
              },
            ),
            onChanged: (value) {
              context
                  .read(generalSettingsControllerProvider.notifier)
                  .update(patternIndex: i);

              if (settings.enableReadAloud) {
                context.read(analyticsControllerProvider).setUserProp(
                    readAloudPropName, settings.readAloudPatterns[i].pattern);
              }
            },
          ),
        const ThemeDivider(),
        SliderTile(
          title: "音量",
          initValue: settings.readAloudVolume,
          max: 1,
          divisions: 10,
          onSubmit: (value) {
            context
                .read(generalSettingsControllerProvider.notifier)
                .update(readAloudVolume: value);

            tts.setVolume(value);
          },
        ),
        FutureBuilder<SpeechRateValidRange>(
          future: tts.getRange(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return SliderTile(
              title: "再生速度",
              initValue: settings.readAloudSpeed ?? snapshot.data!.normal,
              min: snapshot.data!.min,
              max: snapshot.data!.max,
              divisions: (snapshot.data!.max / 0.1).round(),
              onSubmit: (value) {
                context
                    .read(generalSettingsControllerProvider.notifier)
                    .update(readAloudSpeed: value);
                tts.setSpeed(value);
              },
            );
          },
        ),
        const ThemeDivider(),
      ],
    );
  }
}
