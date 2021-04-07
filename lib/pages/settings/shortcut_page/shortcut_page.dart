import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShortcutPage extends StatelessWidget {
  const ShortcutPage({Key? key}) : super(key: key);
  static const String routeName = "/settings/shortcut";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ShortcutPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ショートカット設定"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final left = ref.watch(generalSettingsControllerProvider
        .select((value) => value.leftSlideShortcut));
    final right = ref.watch(generalSettingsControllerProvider
        .select((value) => value.rightSlideShortcut));
    final buttons = ref.watch(generalSettingsControllerProvider
        .select((value) => value.customButtons));

    final enableButtons = buttons.where((element) => element.enable).toList();

    return ListView(children: [
      ListTile(
        title: Text(
          "検索商品を左右にスワイプした際のショートカットを設定します。",
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      const ThemeDivider(),
      ListTile(
        title: Text(
          "左スワイプ",
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      for (var i = 0; i < left.length; i++)
        ListTile(
          title: _createTitle(left[i], buttons),
          trailing: const Icon(Icons.settings),
          onTap: () async {
            final item = await _selectAction(context, enableButtons);
            if (item != null) {
              final updated = [
                for (var j = 0; j < left.length; j++)
                  if (i == j) item else left[j]
              ];

              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(leftShortcut: updated);
            }
          },
        ),
      const ThemeDivider(),
      ListTile(
        title: Text(
          "右スワイプ",
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      for (var i = 0; i < right.length; i++)
        ListTile(
          title: _createTitle(right[i], buttons),
          trailing: const Icon(Icons.settings),
          onTap: () async {
            final item = await _selectAction(context, enableButtons);
            if (item != null) {
              final updated = [
                for (var j = 0; j < right.length; j++)
                  if (i == j) item else right[j]
              ];

              ref
                  .read(generalSettingsControllerProvider.notifier)
                  .update(rightShortcut: updated);
            }
          },
        ),
    ]);
  }

  Widget _createTitle(ShortcutDetail data, List<CustomButtonDetail> buttons) {
    switch (data.type) {
      case ShortcutType.none:
        return const Text("なし");
      case ShortcutType.purchase:
        return const Text("仕入れ");
      case ShortcutType.delete:
        return const Text("削除");
      case ShortcutType.web:
        final button =
            buttons.firstWhere((element) => element.id == data.param);
        return Text(button.title);
      case ShortcutType.navigation:
        return Text(_createNavigationTitle(data.param));
    }
  }

  String _createNavigationTitle(String param) {
    switch (param) {
      case navigationTargetKeepa:
        return "Keepa";
      case navigationTargetNewOffers:
        return "新品一覧";
      case navigationTargetUsedOffers:
        return "中古一覧";
      default:
        throw Exception("Unknown target: $param");
    }
  }

  static const _noneKey = "none";
  static const _purchaseKey = "purchase";
  static const _deleteKey = "delete";
  static const _offersKey = "offers";
  static const _newOffersKey = "newOffers";
  static const _usedOffersKey = "usedOffers";
  static const _keepaKey = "keepa";

  Future<ShortcutDetail?> _selectAction(
      BuildContext context, List<CustomButtonDetail> buttons) async {
    final ret = await showConfirmationDialog(
      context: context,
      title: "アクションを選択",
      actions: [
        const AlertDialogAction(key: _noneKey, label: "なし"),
        const AlertDialogAction(key: _purchaseKey, label: "仕入れ"),
        const AlertDialogAction(key: _deleteKey, label: "削除"),
        const AlertDialogAction(key: _offersKey, label: "出品一覧"),
        const AlertDialogAction(key: _newOffersKey, label: "新品一覧"),
        const AlertDialogAction(key: _usedOffersKey, label: "中古一覧"),
        const AlertDialogAction(key: _keepaKey, label: "Keepa"),
        for (var button in buttons)
          AlertDialogAction(key: button.id, label: button.title)
      ],
    );

    if (ret == null) {
      return null;
    }

    switch (ret) {
      case _noneKey:
        return const ShortcutDetail(type: ShortcutType.none);
      case _purchaseKey:
        return const ShortcutDetail(type: ShortcutType.purchase);
      case _deleteKey:
        return const ShortcutDetail(type: ShortcutType.delete);
      case _offersKey:
        return const ShortcutDetail(type: ShortcutType.web, param: "");
      case _newOffersKey:
        return const ShortcutDetail(
            type: ShortcutType.navigation, param: navigationTargetNewOffers);
      case _usedOffersKey:
        return const ShortcutDetail(
            type: ShortcutType.navigation, param: navigationTargetUsedOffers);
      case _keepaKey:
        return const ShortcutDetail(
            type: ShortcutType.navigation, param: navigationTargetKeepa);
      default:
        final button = buttons.firstWhere((element) => element.id == ret);
        return ShortcutDetail(type: ShortcutType.web, param: button.pattern);
    }
  }
}
