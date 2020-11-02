import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);
  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(generalSettingsControllerProvider.state);
    return ListView(
      children: [
        SwitchListTile(
          title: const Text("ダークモード"),
          value: settings.isDarkMode,
          onChanged: (value) {
            context
                .read(generalSettingsControllerProvider)
                .update(isDarkMode: value);
            context
                .read(analyticsControllerProvider)
                .setUserProp(darkModePropName, value.toString());
          },
        ),
        const ThemeDivider(),
        ListTile(
          title: const Text("このアプリについて"),
          onTap: () async {
            final packageInfo = await PackageInfo.fromPlatform();
            showAboutDialog(
              context: context,
              applicationName: packageInfo.appName,
              applicationVersion:
                  "${packageInfo.version} (build ${packageInfo.buildNumber})",
              applicationLegalese: "Copyright けんず",
            );
          },
        ),
        const ThemeDivider(),
      ],
    );
  }
}
