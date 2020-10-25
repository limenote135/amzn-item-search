import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/search_page/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final currentJanCodeProvider = ScopedProvider<String>(null);

class ItemTile extends HookWidget {
  const ItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jan = useProvider(currentJanCodeProvider);
    if (jan == "") {
      return Container();
    }
    final temp = useProvider(itemFutureProvider(jan));
    return temp.when(
      loading: () => const ListTile(
        tileColor: Colors.white,
        title: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => ListTile(
        title: Container(
          color: Colors.white,
          height: 30,
          child: Text("$error"),
        ),
      ),
      data: (value) {
        final data = useProvider(value.state);
        if (data.asins.isEmpty) {
          return Center(
            child: Container(
              color: Colors.white,
              height: 30,
              child: Text("${data.jan}: 見つかりませんでした"),
            ),
          );
        }

        return ProviderScope(
          overrides: [
            currentItemControllerProvider.overrideWithValue(value),
          ],
          child: Container(
            color: Colors.white,
            child: const ItemTileImpl(),
          ),
        );
      },
    );
  }
}
