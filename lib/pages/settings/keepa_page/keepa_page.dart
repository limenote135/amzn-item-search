import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KeepaSettings extends StatelessWidget {
  const KeepaSettings({Key? key}) : super(key: key);
  static const String routeName = "/settings/keepa";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const KeepaSettings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keepa 設定")),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = useProvider(generalSettingsControllerProvider
        .select((value) => value.keepaSettings));
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text("デフォルト表示設定"),
        ),
        SwitchListTile(
          title: const Text("新品価格"),
          value: settings.showNew,
          onChanged: (value) {
            final newState = settings.copyWith(showNew: value);
            if (newState.showNew || newState.showUsed || newState.showAmazon) {
              // １つ以上は常に選択されるようにする
              context
                  .read(generalSettingsControllerProvider.notifier)
                  .update(keepaSettings: newState);
            }
          },
        ),
        SwitchListTile(
          title: const Text("中古価格"),
          value: settings.showUsed,
          onChanged: (value) {
            final newState = settings.copyWith(showUsed: value);
            if (newState.showNew || newState.showUsed || newState.showAmazon) {
              // １つ以上は常に選択されるようにする
              context
                  .read(generalSettingsControllerProvider.notifier)
                  .update(keepaSettings: newState);
            }
          },
        ),
        SwitchListTile(
          title: const Text("Amazon価格"),
          value: settings.showAmazon,
          onChanged: (value) {
            final newState = settings.copyWith(showAmazon: value);
            if (newState.showNew || newState.showUsed || newState.showAmazon) {
              // １つ以上は常に選択されるようにする
              context
                  .read(generalSettingsControllerProvider.notifier)
                  .update(keepaSettings: newState);
            }
          },
        ),
        ListTile(
          title: const Text("期間"),
          trailing: DropdownButton<KeepaShowPeriod>(
            value: settings.period,
            items: KeepaShowPeriod.values.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text("${e.toValue()}日"),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null && settings.period != value) {
                final newState = settings.copyWith(period: value);
                context
                    .read(generalSettingsControllerProvider.notifier)
                    .update(keepaSettings: newState);
              }
            },
          ),
        )
      ],
    );
  }
}
