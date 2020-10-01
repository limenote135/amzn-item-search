import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

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

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("このアプリについて"),
          onTap: () async {
            final packageInfo = await PackageInfo.fromPlatform();
            showAboutDialog(
              context: context,
              applicationName: packageInfo.appName,
              applicationVersion: packageInfo.version,
              applicationLegalese: "Copyright けんず",
            );
          },
        ),
        const ThemeDivider(),
      ],
    );
  }
}
