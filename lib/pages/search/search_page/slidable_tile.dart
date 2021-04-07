import 'package:amasearch/controllers/general_settings_controller.dart';
import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/pages/search/search_page/slide_actions/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'slide_actions/delete_action.dart';
import 'slide_actions/purchase_action.dart';
import 'slide_actions/web_action.dart';

class SlidableTile extends HookConsumerWidget {
  const SlidableTile({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(generalSettingsControllerProvider);
    final left = settings.leftSlideShortcut;
    final right = settings.rightSlideShortcut;
    final buttons = settings.customButtons;

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      actions: [
        for (final act in left)
          _getAction(context, act.type, act.param, buttons)
      ],
      secondaryActions: [
        for (final act in right)
          _getAction(context, act.type, act.param, buttons)
      ],
      child: child,
    );
  }

  Widget _getAction(BuildContext context, ShortcutType type, String param,
      List<CustomButtonDetail> buttons) {
    switch (type) {
      case ShortcutType.purchase:
        return const PurchaseAction();
      case ShortcutType.delete:
        return const DeleteAction();
      case ShortcutType.web:
        // TODO: Keepa や出品一覧の対応
        final button = buttons.firstWhere((element) => element.id == param);
        return ProviderScope(
          overrides: [
            currentCustomButtonActionProvider.overrideWithValue(button),
          ],
          child: const WebAction(),
        );
      case ShortcutType.navigation:
        return ProviderScope(
          overrides: [
            navigationTargetProvider.overrideWithValue(param),
          ],
          child: const NavigationAction(),
        );
      case ShortcutType.none:
        throw Exception("Invalid type");
    }
  }
}
