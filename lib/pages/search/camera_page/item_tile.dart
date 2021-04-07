import 'package:amasearch/controllers/search_item_controller.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/pages/search/search_page/item_tile.dart';
import 'package:amasearch/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentCodeProvider = ScopedProvider<String>(null);

class CameraItemTile extends HookWidget {
  const CameraItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final code = useProvider(currentCodeProvider);
    if (code == "") {
      return Container();
    }
    final items = useProvider(searchItemControllerProvider);
    return Container(
      color: isDark(context) ? Theme.of(context).backgroundColor : Colors.white,
      child: ProviderScope(
        overrides: [
          currentFutureSearchItemProvider.overrideWithValue(items.first),
        ],
        child: const ItemTile(deletable: false),
      ),
    );
  }
}
