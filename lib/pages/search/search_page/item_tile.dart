import 'package:ama_search/pages/search/search_page/providers.dart';
import 'package:ama_search/styles/font.dart';
import 'package:ama_search/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class ItemTile extends HookWidget {
  const ItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemFuture = useProvider(currentItemFutureProvider);
    return useProvider(itemFuture).when(
      loading: () => const ListTile(
        title: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => ListTile(
        title: SizedBox(
          height: 30,
          child: Text("$error"),
        ),
      ),
      data: (value) {
        if (value.asins.isEmpty) {
          return Center(
            child: SizedBox(
              height: 30,
              child: Text("${value.jan}: 見つかりませんでした"),
            ),
          );
        }
        return ProviderScope(
          overrides: [
            currentItemProvider.overrideWithValue(value),
          ],
          child: const _ItemTileImpl(),
        );
      },
    );
  }
}

class _ItemTileImpl extends HookWidget {
  const _ItemTileImpl({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useProvider(currentItemProvider);
    final firstItem = item.asins.first;
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProviderScope(
            overrides: [
              currentAsinDataProvider.overrideWithValue(firstItem),
              currentAsinCountProvider.overrideWithValue(item.asins.length),
            ],
            child: const _TileImage(),
          ),
          Expanded(
            child: ProviderScope(
              overrides: [
                currentAsinDataProvider.overrideWithValue(firstItem),
              ],
              child: const _TileBody(),
            ),
          )
        ],
      ),
    );
  }
}

class _TileImage extends HookWidget {
  const _TileImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asinData = useProvider(currentAsinDataProvider);
    final asinCount = useProvider(currentAsinCountProvider);
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 75),
      child: Column(
        children: [
          ItemImage(
            url: asinData.imageUrl,
            data: asinData.imageData,
            onComplete: (bytes) {
              // TODO: 画像取得後の処理
            },
          ),
          asinCount > 0 ? const Text("複数") : null,
        ],
      ),
    );
  }
}

class _TileBody extends HookWidget {
  const _TileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = useProvider(currentItemProvider);
    final item = items.asins.first;
    final smallSize = smallFontSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: smallSize,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Row(
          children: [
            Expanded(child: Text("JAN ${item.jan}", style: smallSize)),
            Expanded(child: Text("ASIN: ${item.asin}", style: smallSize)),
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
                      text: "${item.rank}",
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
                "参考: ${item.listPrice} 円",
                style: smallSize,
              ),
            )
          ],
        ),
        Text(
          "検索日: ${DateTime.parse(items.searchDate).toLocal()}",
          style: smallSize,
        )
      ],
    );
  }
}
