import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KeepaSettings extends StatelessWidget {
  const KeepaSettings({super.key});
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

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(
      generalSettingsControllerProvider.select((value) => value.keepaSettings),
    );
    return ListView(
      children: [
        ListTile(
          title: Text("デフォルト表示設定", style: Theme.of(context).textTheme.caption),
        ),
        SwitchListTile(
          title: const Text("新品価格"),
          value: settings.showNew,
          onChanged: (value) {
            final newState = settings.copyWith(showNew: value);
            if (newState.showNew || newState.showUsed || newState.showAmazon) {
              // １つ以上は常に選択されるようにする
              ref
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
              ref
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
              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(keepaSettings: newState);
            }
          },
        ),
        SwitchListTile(
          title: const Text("カート価格"),
          value: settings.showBuyBox,
          onChanged: (value) {
            final newState = settings.copyWith(showBuyBox: value);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(keepaSettings: newState);
          },
        ),
        SwitchListTile(
          title: const Text("FBA 配送"),
          value: settings.showFba,
          onChanged: (value) {
            final newState = settings.copyWith(showFba: value);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(keepaSettings: newState);
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
                ref
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
