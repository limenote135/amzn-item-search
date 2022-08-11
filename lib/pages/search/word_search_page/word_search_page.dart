import 'dart:math';

import 'package:amasearch/models/query_params.dart';
import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/exceptions.dart';
import 'package:amasearch/widgets/progress_indicator.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';

final _currentQueryItemsRequest = StateProvider(
  (ref) => const QueryItemsRequest(query: "", category: ""),
);

final _queryItemResponseProvider =
    FutureProvider.family<List<String>, QueryItemsRequest>((ref, param) async {
  if (param.query == "") {
    return const [];
  }
  final mws = ref.watch(mwsRepositoryProvider);
  final resp = await mws.queryItems(param.query, param.category);
  return resp.asins;
});

final _currentMatchingProductCount =
    Provider.family<AsyncValue<int>, QueryItemsRequest>((ref, param) {
  final asins = ref.watch(_queryItemResponseProvider(param));
  return asins.whenData((value) => value.length);
});

const _kPageSize = 20;

final _asinDataPage =
    FutureProvider.family<List<AsinData>, AsinDataPageParam>((ref, page) async {
  final mws = ref.watch(mwsRepositoryProvider);
  final asins = await ref.watch(_queryItemResponseProvider(page.param).future);
  final total = asins.length;
  final start = page.page * _kPageSize;
  final end = min(total, start + _kPageSize);
  final req = asins.sublist(start, end);
  final resp = await mws.batchGetAsinData(req);
  return resp.data;
});

final asinDataAtIndex =
    Provider.family<AsyncValue<AsinData>, AsinDataIndexAtParam>((ref, index) {
  final offsetInPage = index.index % _kPageSize;
  final page = index.index ~/ _kPageSize;
  final param = AsinDataPageParam(param: index.param, page: page);
  return ref.watch(_asinDataPage(param)).whenData((value) {
    final data = value[offsetInPage];
    if (data.asin == "") {
      throw const AmazonItemNotFoundException("このマーケットでは販売できない商品です");
    }
    return data;
  });
});

class WordSearchPage extends StatelessWidget {
  const WordSearchPage({Key? key}) : super(key: key);
  static const String routeName = "/word_search";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _AppBar(),
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends HookConsumerWidget {
  const _AppBar({Key? key}) : super(key: key);

  static final _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final req = ref.watch(_currentQueryItemsRequest);

    final height = useState<double>(0);
    WidgetsBinding.instance.addPostFrameCallback((cb) {
      // build が完了した後に AppBar の高さを計算して設定、再描画する
      final obj = _appBarKey.currentContext?.findRenderObject();
      if (obj != null) {
        // ValueNotifier 内で値が同じなら set がスキップされるので、事前にチェックはしないでよい
        height.value = obj.paintBounds.height;
      }
    });
    return SliverAppBar(
      title: Column(
        key: _appBarKey,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "フリーワード検索",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: controller.clear,
                ),
              ),
              onSubmitted: (value) {
                if (value != "") {
                  if (req.query == value) {
                    // 変更がない場合は強制リロードする
                    ref.refresh(_queryItemResponseProvider(req));
                    return;
                  }
                  ref.read(_currentQueryItemsRequest.notifier).state =
                      req.copyWith(query: value);
                }
              },
            ),
          ),
          ListTile(
            title: const Text("カテゴリー"),
            trailing: DropdownButton(
              value: req.category,
              items: amazonSearchCategoryMap.entries.map((entry) {
                return DropdownMenuItem(
                  value: entry.value,
                  child: Text(entry.key),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null && req.category != value) {
                  ref.read(_currentQueryItemsRequest.notifier).state =
                      req.copyWith(category: value);
                }
              },
            ),
          ),
          const ThemeDivider(),
        ],
      ),
      centerTitle: true,
      toolbarHeight: height.value,
      floating: true,
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  static const _maxQueryLength = 128;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(_currentQueryItemsRequest);
    final totalAsyncValue = ref.watch(_currentMatchingProductCount(param));

    if (param.query == "") {
      return SliverList(
        delegate: SliverChildListDelegate([Container()]),
      );
    }

    if (param.query.length > _maxQueryLength) {
      return SliverList(
        delegate: SliverChildListDelegate([const Text("エラー: 検索文字列が長すぎます")]),
      );
    }
    return SliverList(
      delegate: totalAsyncValue.when(
        loading: () => SliverChildListDelegate([
          const ListTile(title: centeredCircularProgressIndicator),
        ]),
        error: (error, stackTrace) {
          recordError(
            error,
            stackTrace,
            information: [
              "WordSearchPage.AppBar.Body.totalAsyncValue",
              "req: $param",
            ],
          );
          return SliverChildListDelegate([Text("$error")]);
        },
        data: (value) {
          if (value == 0) {
            return SliverChildListDelegate([Container()]);
          }
          return SliverChildBuilderDelegate(
            (context, index) {
              if (index.isOdd) {
                return const ThemeDivider();
              }
              return ProviderScope(
                overrides: [
                  currentQueryParam.overrideWithValue(param),
                  currentIndex.overrideWithValue(index ~/ 2),
                ],
                child: const ItemTile(),
              );
            },
            childCount: value * 2,
          );
        },
      ),
    );
  }
}
