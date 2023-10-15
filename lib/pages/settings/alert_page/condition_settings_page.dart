import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/alert_condition.dart';
import 'package:amasearch/models/enums/alert_type.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'analytics.dart';

final _currentAlertConditionSetIndexProvider =
    Provider<int>((_) => throw UnimplementedError());

class ConditionSettingsPage extends StatelessWidget {
  const ConditionSettingsPage({super.key});
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

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(_currentAlertConditionSetIndexProvider);
    final alerts = ref.watch(
      generalSettingsControllerProvider.select((value) => value.alerts),
    );
    final alert = alerts[index];

    final smallSize = smallFontSize(context);

    void modifyCondition(List<AlertCondition> cond) {
      final newAlert = alert.copyWith(conditions: cond);
      final newAlerts = [
        for (var i = 0; i < alerts.length; i++)
          i == index ? newAlert : alerts[i],
      ];
      ref
          .read(generalSettingsControllerProvider.notifier)
          .update(alerts: newAlerts);
      updateAlertConditionAnalytics(context, ref, newAlerts);
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
                  initialText: alert.title,
                  validator: (value) =>
                      value!.isEmpty ? "アラート名を入力してください" : null,
                ),
              ],
              title: "アラート名",
            );
            if (text == null) {
              return;
            }
            final newAlerts = [
              for (var i = 0; i < alerts.length; i++)
                i == index ? alerts[i].copyWith(title: text.single) : alerts[i],
            ];
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(alerts: newAlerts);
            updateAlertConditionAnalytics(context, ref, newAlerts);
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
                        if (i != index) alert.conditions[i],
                    ];
                    modifyCondition(newCond);
                  },
                ),
              ),
          ],
          divider: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("AND", style: smallSize),
          ),
        ),
        const ThemeDivider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("設定可能な項目"),
        ),
        _ConditionTile(
          title: const Text("粗利"),
          type: AlertType.profit,
          onTap: () async {
            final val = await showTextInputDialog(
              context: context,
              textFields: [
                DialogTextField(
                  keyboardType: TextInputType.number,
                  suffixText: "円以上",
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                ),
              ],
              title: "粗利額",
            );

            if (val == null) {
              return null;
            }

            return int.tryParse(val.single);
          },
        ),
        _ConditionTile(
          title: const Text("コンディション"),
          subtitle: Text(
            "粗利条件と一緒に設定してください。",
            style: captionFontSize(context),
          ),
          type: AlertType.condition,
          onTap: () async {
            final val = await showConfirmationDialog<int?>(
              context: context,
              title: "コンディション",
              actions: [
                for (final val in AlertOfferCondition.values)
                  AlertDialogAction(
                    key: val.index,
                    label: val.toDisplayString(),
                  ),
              ],
            );
            if (val == null) {
              return null;
            }
            return val;
          },
        ),
        _ConditionTile(
          title: const Text("ランキング"),
          type: AlertType.rank,
          onTap: () async {
            final val = await showTextInputDialog(
              context: context,
              textFields: [
                DialogTextField(
                  suffixText: "位以内",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                ),
              ],
              title: "順位",
            );
            if (val == null) {
              return null;
            }
            return int.parse(val.single);
          },
        ),
        _ConditionTile(
          title: const Text("カテゴリ"),
          type: AlertType.category,
          onTap: () async {
            final val = await showConfirmationDialog<int?>(
              context: context,
              title: "カテゴリ",
              actions: [
                for (final ent in mwsCategoryIdMap.entries)
                  AlertDialogAction(key: ent.value, label: ent.key),
              ],
            );
            if (val == null) {
              return null;
            }
            return val;
          },
        ),
        _ConditionTile(
          title: const Text("定価以上(プレ値)"),
          type: AlertType.premium,
          allowOverwrite: false,
          onTap: () async {
            return 0;
          },
        ),
        _ConditionTile(
          title: const Text("新規出品者数"),
          type: AlertType.newOfferCount,
          onTap: () async {
            final val = await showTextInputDialog(
              context: context,
              title: "新品出品者数",
              textFields: [
                DialogTextField(
                  keyboardType: TextInputType.number,
                  suffixText: "人以下",
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                ),
              ],
            );
            if (val == null) {
              return null;
            }
            return int.parse(val.single);
          },
        ),
        _ConditionTile(
          title: const Text("中古出品者数"),
          type: AlertType.usedOfferCount,
          onTap: () async {
            final val = await showTextInputDialog(
              context: context,
              title: "中古出品者数",
              textFields: [
                DialogTextField(
                  keyboardType: TextInputType.number,
                  suffixText: "人以下",
                  validator: (value) {
                    final n = int.tryParse(value ?? "");
                    return n != null && n >= 0 ? null : "不正な値です";
                  },
                ),
              ],
            );
            if (val == null) {
              return null;
            }
            return int.parse(val.single);
          },
        ),
        _ConditionTile(
          title: const Text("Amazon販売なし"),
          type: AlertType.noAmazon,
          allowOverwrite: false,
          onTap: () async {
            return 0;
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
        return const Text("Amazon販売なし");
      case AlertType.noNewOffer:
        return const Text("新品なし");
      case AlertType.newOfferCount:
        return const Text("新品出品者数");
      case AlertType.usedOfferCount:
        return const Text("中古出品者数");
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
        return Text("$param 位以内");
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
      case AlertType.newOfferCount:
        return Text("$param 人以下");
      case AlertType.usedOfferCount:
        return Text("$param 人以下");
    }
  }

  Future<List<AlertCondition>?> overwriteCondition(
    BuildContext context,
    List<AlertCondition> conditions,
    AlertType type,
    int value,
  ) async {
    if (conditions.any((e) => e.type == type)) {
      final ret = await showOkCancelAlertDialog(
        context: context,
        title: "条件の上書き",
        message: "既存の設定を上書きしますか？",
      );
      if (ret == OkCancelResult.cancel) {
        return null;
      }
    }

    final newCond = conditions.where((e) => e.type != type).toList()
      ..add(
        AlertCondition(
          type: AlertType.profit,
          value: value,
        ),
      );

    return newCond;
  }
}

List<Widget> _dividedTiles({
  required List<Widget> children,
  required Widget divider,
}) {
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

class _ConditionTile extends ConsumerWidget {
  const _ConditionTile({
    required this.title,
    this.subtitle,
    required this.type,
    this.allowOverwrite = true,
    required this.onTap,
  });

  final Widget title;
  final Widget? subtitle;
  final AlertType type;
  final bool allowOverwrite;
  final Future<int?> Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(_currentAlertConditionSetIndexProvider);
    final alerts = ref.watch(
      generalSettingsControllerProvider.select((value) => value.alerts),
    );
    final alert = alerts[index];

    void modifyCondition(List<AlertCondition> cond) {
      final newAlert = alert.copyWith(conditions: cond);
      final newAlerts = [
        for (var i = 0; i < alerts.length; i++)
          i == index ? newAlert : alerts[i],
      ];
      ref
          .read(generalSettingsControllerProvider.notifier)
          .update(alerts: newAlerts);
      updateAlertConditionAnalytics(context, ref, newAlerts);
    }

    return ListTile(
      leading: alert.conditions.length < 10 ? const Icon(Icons.add) : null,
      title: title,
      subtitle: subtitle,
      onTap: () async {
        if (alert.conditions.length >= 10) {
          return;
        }
        final value = await onTap();
        if (value == null) {
          return;
        }

        final isContained = alert.conditions.any((e) => e.type == type);
        if (isContained) {
          if (allowOverwrite) {
            final ret = await showOkCancelAlertDialog(
              context: context,
              title: "条件の上書き",
              message: "既存の設定を上書きしますか？",
            );
            if (ret == OkCancelResult.cancel) {
              return;
            }
          } else {
            // 上書きを許可しない場合、既に追加済みの場合は何もしない
            return;
          }
        }

        final newCond = alert.conditions.where((e) => e.type != type).toList()
          ..add(
            AlertCondition(
              type: type,
              value: value,
            ),
          );

        modifyCondition(newCond);
      },
    );
  }
}
