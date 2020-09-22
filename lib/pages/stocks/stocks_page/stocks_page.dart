import 'package:amasearch/controllers/stock_item_controller.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/pages/stocks/stocks_page/item_tile.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/all.dart';

class StocksPage extends StatelessWidget {
  const StocksPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("仕入れ済み在庫"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(stockItemListControllerProvider.state);

    return ListView(
      children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            for (final item in items)
              ProviderScope(
                overrides: [
                  currentStockItemProvider.overrideWithValue(item),
                ],
                child: const SlidableDeleteTile(child: ItemTile()),
              )
          ],
        ).toList(),
        const ThemeDivider(),
      ],
    );
  }
}

class SlidableDeleteTile extends HookWidget {
  const SlidableDeleteTile({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentStockItemProvider);
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: [
        IconSlideAction(
          caption: "削除",
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
            final ok = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("アイテムの削除"),
                content: const Text("在庫リストからアイテムを削除します"),
                actions: [
                  FlatButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  FlatButton(
                    child: const Text("OK"),
                    onPressed: () => Navigator.of(context).pop(true),
                  )
                ],
              ),
            );
            if (ok) {
              context.read(stockItemListControllerProvider).remove([item]);
            }
          },
        ),
      ],
      child: child,
    );
  }
}
