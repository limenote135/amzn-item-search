import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/alert_condition.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentAlertConditionSetIndexProvider = ScopedProvider<int>(null);

class ConditionSettingsPage extends StatelessWidget {
  const ConditionSettingsPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/alert/condition";

  static Route<String> route(int index) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        return ProviderScope(
          overrides: [
            _currentAlertConditionSetIndexProvider.overrideWithValue(index),
          ],
          child: const ConditionSettingsPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("条件設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useProvider(_currentAlertConditionSetIndexProvider);
    final alerts = useProvider(
        generalSettingsControllerProvider.select((value) => value.alerts));
    final alert = alerts[index];

    final smallSize = smallFontSize(context);

    void modifyCondition(List<AlertCondition> cond) {
      final newAlert = alert.copyWith(conditions: cond);
      final newAlerts = [
        for (var i = 0; i < alerts.length; i++)
          i == index ? newAlert : alerts[i]
      ];
      context
          .read(generalSettingsControllerProvider.notifier)
          .update(alerts: newAlerts);
    }

    return ListView(
      children: [
        ListTile(
          title: Text(alert.title),
          trailing: const Icon(Icons.edit),
          onTap: () async {
            final text = await showTextInputDialog(
              context: context,
              textFields: [
                DialogTextField(
                  validator: (value) =>
                      value!.isEmpty ? "アラート名を入力してください" : null,
                )
              ],
              title: "アラート名",
            );
            if (text == null) {
              return;
            }
            final newAlerts = [
              for (var i = 0; i < alerts.length; i++)
                i == index ? alerts[i].copyWith(title: text.single) : alerts[i]
            ];
            context
                .read(generalSettingsControllerProvider.notifier)
                .update(alerts: newAlerts);
          },
        ),
        const ThemeDivider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("アラート条件"),
        ),
        ..._dividedTiles(
          children: [
            for (var index = 0; index < alert.conditions.length; index++)
              ListTile(
                title: _getTitle(alert.conditions[index].type),
                subtitle: _getSubTitle(
                  alert.conditions[index].type,
                  alert.conditions[index].value,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final ret = await showOkCancelAlertDialog(
                      context: context,
                      title: "条件の削除",
                      message: "この条件を削除してもよいですか？",
                      isDestructiveAction: true,
                    );
                    if (ret == OkCancelResult.cancel) {
                      return;
                    }
                    final newCond = [
                      for (var i = 0; i < alert.conditions.length; i++)
                        if (i != index) alert.conditions[i]
                    ];
                    modifyCondition(newCond);
                  },
                ),
              ),
          ],
          divider: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Text("AND", style: smallSize),
          ),
        ),
        const ThemeDivider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("設定可能な項目"),
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("粗利"),
          onTap: () async {
            if (alert.conditions.length >= 10) {
              return;
            }
            final val = await showTextInputDialog(
              context: context,
              textFields: [
                DialogTextField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                )
              ],
              title: "粗利額",
            );
            if (val == null) {
              return;
            }
            final newCond = alert.conditions.toList()
              ..add(AlertCondition(
                  type: AlertType.profit, value: int.parse(val.single)));
            modifyCondition(newCond);
          },
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("コンディション"),
          subtitle: Text(
            "粗利条件と一緒に設定してください。",
            style: captionSize(context),
          ),
          onTap: () async {
            final val = await showConfirmationDialog<int?>(
              context: context,
              title: "コンディション",
              actions: [
                for (final val in AlertOfferCondition.values)
                  AlertDialogAction(
                      key: val.index, label: val.toDisplayString())
              ],
            );
            if (val == null) {
              return;
            }
            final newCond = alert.conditions.toList()
              ..add(AlertCondition(type: AlertType.condition, value: val));
            modifyCondition(newCond);
          },
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("ランキング"),
          onTap: () async {
            if (alert.conditions.length >= 10) {
              return;
            }
            final val = await showTextInputDialog(
              context: context,
              textFields: [
                DialogTextField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                )
              ],
              title: "順位",
            );
            if (val == null) {
              return;
            }
            final newCond = alert.conditions.toList()
              ..add(AlertCondition(
                  type: AlertType.rank, value: int.parse(val.single)));
            modifyCondition(newCond);
          },
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("カテゴリ"),
          onTap: () async {
            final val = await showConfirmationDialog<int?>(
                context: context,
                title: "カテゴリ",
                actions: [
                  for (final ent in mwsCategoryIdMap.entries)
                    AlertDialogAction(key: ent.value, label: ent.key),
                ]);
            if (val == null) {
              return;
            }
            final newCond = alert.conditions.toList()
              ..add(AlertCondition(type: AlertType.category, value: val));
            modifyCondition(newCond);
          },
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("定価以上(プレ値)"),
          onTap: () {
            if (alert.conditions.length >= 10) {
              return;
            }
            final newCond = alert.conditions.toList()
              ..add(const AlertCondition(type: AlertType.premium));
            modifyCondition(newCond);
          },
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("新品なし"),
          onTap: () {
            if (alert.conditions.length >= 10) {
              return;
            }
            final newCond = alert.conditions.toList()
              ..add(const AlertCondition(type: AlertType.noNewOffer));
            modifyCondition(newCond);
          },
        ),
      ],
    );
  }

  Widget _getTitle(AlertType type) {
    switch (type) {
      case AlertType.profit:
        return const Text("粗利");
      case AlertType.condition:
        return const Text("コンディション");
      case AlertType.rank:
        return const Text("ランキング");
      case AlertType.category:
        return const Text("カテゴリ");
      case AlertType.premium:
        return const Text("定価以上(プレ値)");
      case AlertType.noAmazon:
        // TODO: 未実装
        return Container();
      case AlertType.noNewOffer:
        return const Text("新品なし");
    }
  }

  Widget? _getSubTitle(AlertType type, int param) {
    switch (type) {
      case AlertType.profit:
        return Text("$param 円以上");
      case AlertType.condition:
        if (param > AlertOfferCondition.values.length) {
          return const Text("不明");
        }
        final val = AlertOfferCondition.values[param];
        return Text(val.toDisplayString());
      case AlertType.rank:
        return Text("$param 位以下");
      case AlertType.category:
        if (mwsCategoryIdMap.containsValue(param)) {
          final name = mwsCategoryIdMap.entries
              .singleWhere((element) => element.value == param)
              .key;
          return Text(name);
        }
        return const Text("不明");
      case AlertType.premium:
        return null;
      case AlertType.noAmazon:
        return null;
      case AlertType.noNewOffer:
        return null;
    }
  }
}

List<Widget> _dividedTiles(
    {required List<Widget> children, required Widget divider}) {
  final itemCount = max(0, children.length * 2 - 1);
  Widget childDelegate(int index) {
    final itemIndex = index ~/ 2;
    if (index.isEven) {
      return children[itemIndex];
    }
    return divider;
  }

  return [for (var i = 0; i < itemCount; i++) childDelegate(i)].toList();
}
