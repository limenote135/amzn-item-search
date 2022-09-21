import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/pricetar_stopper.dart';
import 'package:amasearch/models/enums/sellersket_revise_rule.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class SellerSketPage extends StatelessWidget {
  const SellerSketPage({super.key});
  static const String routeName = "/settings/csv/sellersket";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SellerSketPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("セラースケット設定"),
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
          .select((value) => value.sellerSketSettings),
    );
    return ListView(
      children: [
        ListTile(
          title: const Text("価格改定ルール(新品)"),
          subtitle: Text(settings.newRule.displayString),
          onTap: () async {
            final ret = await showConfirmationDialog(
              context: context,
              title: "価格改定ルール",
              initialSelectedActionKey: settings.newRule,
              actions: [
                for (final val in SellerSketReviseRule.values)
                  AlertDialogAction(
                    key: val,
                    label: val.displayString,
                  ),
              ],
            );
            if (ret == null) {
              return;
            }
            final value = settings.copyWith(newRule: ret);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(sellerSketSettings: value);
          },
        ),
        ListTile(
          title: const Text("価格改定ルール(中古)"),
          subtitle: Text(settings.usedRule.displayString),
          onTap: () async {
            final ret = await showConfirmationDialog(
              context: context,
              title: "価格改定ルール",
              initialSelectedActionKey: settings.usedRule,
              actions: [
                for (final val in SellerSketReviseRule.values)
                  if (val != SellerSketReviseRule.cart)
                    AlertDialogAction(
                      key: val,
                      label: val.displayString,
                    ),
              ],
            );
            if (ret == null) {
              return;
            }
            final value = settings.copyWith(usedRule: ret);
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(sellerSketSettings: value);
          },
        ),
        ListTile(
          title: const Text("値下げリミット"),
          subtitle: Text(
            createStopperText(
              settings.lowestStopperType,
              settings.lowestStopperValue,
            ),
          ),
          onTap: () async {
            final stopperType = await showConfirmationDialog(
              context: context,
              title: "値下げリミット指定方法",
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
                      return n != null ? null : "不正な値です";
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
                .update(sellerSketSettings: newSettings);
          },
        ),
        ListTile(
          title: const Text("値上げリミット"),
          subtitle: Text(
            createStopperText(
              settings.highestStopperType,
              settings.highestStopperValue,
            ),
          ),
          onTap: () async {
            final stopperType = await showConfirmationDialog(
              context: context,
              title: "値上げリミット指定方法",
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
                      if (n == null) {
                        return "不正な値です";
                      }
                      if (stopperType == RevisePriceStopper.listingPrice &&
                          n < 100) {
                        return "出品価格を下回っています";
                      }
                      return null;
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
                .update(sellerSketSettings: newSettings);
          },
        ),
        ListTile(
          title: const Text("配送パターン名"),
          subtitle: Text(settings.shippingPattern),
          onTap: () async {
            final values = await showTextInputDialog(
              context: context,
              title: "配送パターンの設定",
              message: "自己発送時の発送パターン名を入れてください",
              textFields: [
                DialogTextField(
                  initialText: settings.shippingPattern,
                ),
              ],
            );
            if (values == null) {
              return;
            }

            final newSettings = settings.copyWith(
              shippingPattern: values.single,
            );
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(sellerSketSettings: newSettings);
          },
        ),
      ],
    );
  }
}
