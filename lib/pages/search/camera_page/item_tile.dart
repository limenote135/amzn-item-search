import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/search_page/item_tile.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentCodeProvider = Provider<String>((_) => throw UnimplementedError());

class CameraItemTile extends HookConsumerWidget {
  const CameraItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(currentCodeProvider);
    if (code == "") {
      return Container();
    }
    final items = ref.watch(searchItemControllerProvider);
    return ColoredBox(
      color: isDark(context)
          ? Theme.of(context).colorScheme.background
          : Colors.white,
      child: ProviderScope(
        overrides: [
          currentFutureSearchItemProvider.overrideWithValue(items.first),
        ],
        child: Scrollable(
          viewportBuilder: (context, position) => const ItemTile(),
        ),
      ),
    );
  }
}
