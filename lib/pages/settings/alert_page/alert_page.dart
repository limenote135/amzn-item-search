import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/properties.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/pages/settings/alert_page/condition_settings_page.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/auth.dart';
import 'package:amasearch/util/uuid.dart';
import 'package:amasearch/widgets/payment.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'analytics.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});
  static const String routeName = "/settings/alert";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const AlertPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("アラート設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    final uuid = ref.watch(uuidProvider);
    final isPaidUser = ref.watch(isPaidUserProvider);
    final smallStrongText = smallFontSize(context)!.merge(strongTextStyle);

    return ListView(
      children: [
        SwitchListTile(
          title: const Text("アラートを有効にする"),
          subtitle: const Text("条件に一致した商品が強調表示されます。"),
          value: settings.enableAlert,
          onChanged: (value) {
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(enableAlert: value);
            ref
                .read(analyticsControllerProvider)
                .setUserProp(enableAlertPropName, value.toString());
          },
        ),
        SwitchListTile(
          title: const Text("条件一致時にバイブレーション"),
          value: settings.enableAlertVibration,
          onChanged: (value) {
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(enableAlertVibration: value);
            ref
                .read(analyticsControllerProvider)
                .setUserProp(enableAlertVibrationPropName, value.toString());
          },
        ),
        const ThemeDivider(),
        if (!isPaidUser)
          ListTile(
            title: Text(
              "フリープランではアラートは2つまでしか利用できません",
              style: smallStrongText,
            ),
          ),
        for (var i = 0; i < settings.alerts.length; i++)
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(settings.alerts[i].title),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final ret = await showOkCancelAlertDialog(
                  context: context,
                  title: "条件の削除",
                  message: "この条件を削除してもよいですか？",
                  isDestructiveAction: true,
                );
                if (ret == OkCancelResult.ok) {
                  final newAlerts = [
                    for (var j = 0; j < settings.alerts.length; j++)
                      if (i != j) settings.alerts[j],
                  ];
                  ref
                      .read(generalSettingsControllerProvider.notifier)
                      .update(alerts: newAlerts);
                  updateAlertConditionAnalytics(context, ref, newAlerts);
                }
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                ConditionSettingsPage.route(i),
              );
            },
          ),
        ListTile(
          leading: const Icon(Icons.add),
          title: (settings.alerts.length < 2 || isPaidUser)
              ? const Text("条件を追加")
              : const WithLockIconIfNotPaid(child: Text("条件を追加")),
          onTap: () async {
            final alertCount = settings.alerts.length;
            if (alertCount >= 2 && !isPaidUser) {
              await showUnpaidDialog(
                context,
                message: "フリープランではアラートは2つまでしか設定できません。",
              );
              return;
            }
            final item = AlertConditionSet(
              id: uuid.v4(),
              title: "アラート条件",
            );
            ref
                .read(generalSettingsControllerProvider.notifier)
                .update(alerts: [...settings.alerts, item]);
          },
        ),
        const ThemeDivider(),
      ],
    );
  }
}
