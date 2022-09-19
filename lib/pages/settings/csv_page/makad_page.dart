import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/makad_payment_method.dart';
import 'package:amasearch/models/enums/makad_revise_rule.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class MakadPage extends StatelessWidget {
  const MakadPage({super.key});
  static const String routeName = "/settings/csv/makad";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const MakadPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("マカド設定"),
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
      generalSettingsControllerProvider.select((value) => value.makadSettings),
    );
    return ListView(
      children: [
        ListTile(
          title: const Text("価格改定モード(新品)"),
          subtitle: Text(settings.newRule.displayString),
          onTap: () async {
            final ret = await showConfirmationDialog(
              context: context,
              title: "価格改定ルール",
              initialSelectedActionKey: settings.newRule,
              actions: [
                for (final val in MakadReviseRule.values
                    .where((e) => !e.name.startsWith("used")))
                  AlertDialogAction(key: val, label: val.displayString),
              ],
            );
            if (ret == null) {
              return;
            }
            final value = settings.copyWith(newRule: ret);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(makadSettings: value);
          },
        ),
        ListTile(
          title: const Text("価格改定モード(中古)"),
          subtitle: Text(settings.usedRule.displayString),
          onTap: () async {
            final ret = await showConfirmationDialog(
              context: context,
              title: "価格改定ルール",
              initialSelectedActionKey: settings.usedRule,
              actions: [
                for (final val in MakadReviseRule.values
                    .where((e) => !e.name.startsWith("new")))
                  AlertDialogAction(key: val, label: val.displayString),
              ],
            );
            if (ret == null) {
              return;
            }
            final value = settings.copyWith(usedRule: ret);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(makadSettings: value);
          },
        ),
        ListTile(
          title: const Text("下限価格"),
          subtitle: Text(
            createStopperText(
              settings.lowestStopperType,
              settings.lowestStopperValue,
            ),
          ),
          onTap: () async {
            final stopperType = await showConfirmationDialog(
              context: context,
              title: "下限価格指定方法",
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
                .update(makadSettings: newSettings);
          },
        ),
        ListTile(
          title: const Text("支払い方法の制限"),
          subtitle: Text(settings.paymentMethod.displayString),
          onTap: () async {
            final ret = await showConfirmationDialog(
              context: context,
              title: "制限する支払方法",
              initialSelectedActionKey: settings.paymentMethod,
              actions: [
                for (final val in MakadPaymentMethod.values)
                  AlertDialogAction(key: val, label: val.displayString)
              ],
            );
            if (ret == null) {
              return;
            }
            final value = settings.copyWith(paymentMethod: ret);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(makadSettings: value);
          },
        ),
      ],
    );
  }
}
