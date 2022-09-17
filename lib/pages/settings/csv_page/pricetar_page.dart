import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/pricetar_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class PricetarPage extends StatelessWidget {
  const PricetarPage({super.key});
  static const String routeName = "/settings/csv/pricetar";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PricetarPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プライスター設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(
      generalSettingsControllerProvider
          .select((value) => value.pricetarSettings),
    );
    return ListView(
      children: [
        ListTile(
          title: const Text("価格改定ルール(新品)"),
          subtitle: Text(settings.newRule.toDisplayString()),
          onTap: () async {
            final ret = await showConfirmationDialog(
              context: context,
              title: "価格改定ルール",
              initialSelectedActionKey: settings.newRule,
              actions: [
                for (final val in PricetarRule.values)
                  AlertDialogAction(
                    key: val,
                    label: val.toDisplayString(),
                  ),
              ],
            );
            if (ret == null) {
              return;
            }
            final value = settings.copyWith(newRule: ret);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(pricetarSettings: value);
          },
        ),
        ListTile(
          title: const Text("価格改定ルール(中古)"),
          subtitle: Text(settings.usedRule.toDisplayString()),
          onTap: () async {
            final ret = await showConfirmationDialog(
              context: context,
              title: "価格改定ルール",
              initialSelectedActionKey: settings.usedRule,
              actions: [
                for (final val in PricetarRule.values)
                  if (val != PricetarRule.cart)
                    AlertDialogAction(
                      key: val,
                      label: val.toDisplayString(),
                    ),
              ],
            );
            if (ret == null) {
              return;
            }
            final value = settings.copyWith(usedRule: ret);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(pricetarSettings: value);
          },
        ),
        ListTile(
          title: const Text("赤字ストッパー"),
          subtitle: Text(
            createStopperText(
              settings.lowestStopperType,
              settings.lowestStopperValue,
            ),
          ),
          onTap: () async {
            final stopperType = await showConfirmationDialog(
              context: context,
              title: "赤字ストッパー指定方法",
              initialSelectedActionKey: settings.lowestStopperType,
              actions: [
                for (final val in RevisePriceStopper.values)
                  AlertDialogAction(
                    key: val,
                    label: val.toDisplayString(),
                  ),
              ],
            );
            if (stopperType == null) {
              return;
            }
            var stopperValue = 0;
            if (stopperType != RevisePriceStopper.nothing) {
              final values = await showTextInputDialog(
                context: context,
                title: createStopperValueInputTitle(stopperType),
                message: createStopperValueInputMessage(stopperType),
                textFields: [
                  DialogTextField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final n = int.tryParse(value ?? "");
                      return n != null && n >= 0 ? null : "不正な値です";
                    },
                  )
                ],
              );
              if (values == null) {
                return;
              }
              stopperValue = int.parse(values.single);
            }

            final newSettings = settings.copyWith(
              lowestStopperType: stopperType,
              lowestStopperValue: stopperValue,
            );
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(pricetarSettings: newSettings);
          },
        ),
        ListTile(
          title: const Text("高値ストッパー"),
          subtitle: Text(
            createStopperText(
              settings.highestStopperType,
              settings.highestStopperValue,
            ),
          ),
          onTap: () async {
            final stopperType = await showConfirmationDialog(
              context: context,
              title: "高値ストッパー指定方法",
              initialSelectedActionKey: settings.highestStopperType,
              actions: [
                for (final val in RevisePriceStopper.values)
                  AlertDialogAction(
                    key: val,
                    label: val.toDisplayString(),
                  ),
              ],
            );
            if (stopperType == null) {
              return;
            }
            var stopperValue = 0;
            if (stopperType != RevisePriceStopper.nothing) {
              final values = await showTextInputDialog(
                context: context,
                title: createStopperValueInputTitle(stopperType),
                message: createStopperValueInputMessage(stopperType),
                textFields: [
                  DialogTextField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final n = int.tryParse(value ?? "");
                      return n != null && n >= 0 ? null : "不正な値です";
                    },
                  )
                ],
              );
              if (values == null) {
                return;
              }
              stopperValue = int.parse(values.single);
            }

            final newSettings = settings.copyWith(
              highestStopperType: stopperType,
              highestStopperValue: stopperValue,
            );
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(pricetarSettings: newSettings);
          },
        ),
      ],
    );
  }
}
