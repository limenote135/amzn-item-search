import 'dart:typed_data';

import 'package:amasearch/models/item.dart';
import 'package:amasearch/pages/search/common/price_info.dart';
import 'package:amasearch/styles/font.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:amasearch/util/price_util.dart';
import 'package:amasearch/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentSearchDateProvider = ScopedProvider<String>(null);
final isEllipsisProvider = ScopedProvider<bool>((_) => false);

class SearchItemTile extends HookWidget {
  const SearchItemTile({Key key, this.onComplete}) : super(key: key);
  final void Function(ByteData bytes) onComplete;

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final tile = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TileImage(
          onComplete: onComplete,
        ),
        const Expanded(
          child: _ItemTileBody(),
        )
      ],
    );
    return isPremiumPrice(item) ? _StrongContainer(tile) : tile;
  }
}

class _StrongContainer extends StatelessWidget {
  const _StrongContainer(this.child, {Key key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        );
    return Container(
      color: Colors.red[100],
      child: Theme(
        data: Theme.of(context).copyWith(textTheme: newTextTheme),
        child: child,
      ),
    );
  }
}

class _ItemTileBody extends HookWidget {
  const _ItemTileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentAsinDataProvider);
    final date = useProvider(currentSearchDateProvider);
    final isEllipsis = useProvider(isEllipsisProvider);

    final smallSize = smallFontSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isEllipsis
            ? Text(
                item.title,
                style: captionSize(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            : Text(
                item.title,
                style: captionSize(context),
              ),
        Row(
          children: [
            Expanded(child: Text("JAN ${item.jan}", style: smallSize)),
            Expanded(child: Text("ASIN: ${item.asin}", style: smallSize)),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text(item.category, style: smallSize)),
            Expanded(child: Text("セット数: ${item.quantity} 個", style: smallSize)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "順位: ",
                  children: [
                    TextSpan(
                      text: numberFormatter.format(item.rank),
                      style: strongTextStyle,
                    ),
                    const TextSpan(
                      text: " 位",
                    ),
                  ],
                ),
                style: smallSize,
              ),
            ),
            Expanded(
              child: Text(
                "参考: ${numberFormatter.format(item.listPrice)} 円",
                style: smallSize,
              ),
            )
          ],
        ),
        const PriceInfo(),
        if (date != null)
          Text(
            "検索日: ${DateTime.parse(date).toLocal().format()}",
            style: smallSize,
          )
      ],
    );
  }
}
