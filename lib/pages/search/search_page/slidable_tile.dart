import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/purchase_page/purchase_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/all.dart';

class SlidableTile extends HookWidget {
  const SlidableTile({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(currentItemControllerProvider);
    final item = useProvider(provider.state.select((e) => e.asins.first));

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      actions: [
        IconSlideAction(
          caption: "仕入れ",
          color: Colors.blue,
          icon: Icons.add_shopping_cart,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => ProviderScope(
                  overrides: [
                    currentAsinDataProvider.overrideWithValue(item),
                  ],
                  child: const PurchasePage(),
                ),
              ),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
