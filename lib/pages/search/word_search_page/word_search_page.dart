import 'dart:math';

import 'package:amasearch/controllers/word_search_history_controller.dart';
import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/query_params.dart';
import 'package:amasearch/models/word_search_history.dart';
import 'package:amasearch/pages/search/word_search_page/search_history_page.dart';
import 'package:amasearch/repository/amazon.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/repository/mws_category.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/exceptions.dart';
import 'package:amasearch/util/util.dart';
import 'package:amasearch/widgets/progress_indicator.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_tile.dart';

final _currentQueryItemsRequest = StateProvider(
  (ref) => const QueryItemsRequest(query: "", category: ""),
);

final _currentMatchingProductCount = Provider.autoDispose
    .family<AsyncValue<int>, QueryItemsRequest>((ref, param) {
  final asins = ref.watch(queryItemResultProvider(param));
  return asins.whenData((value) => value.length);
});

const _kPageSize = 20;

final _asinDataPage = FutureProvider.autoDispose
    .family<List<AsinData>, AsinDataPageParam>((ref, page) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final mws = ref.watch(mwsRepositoryProvider);
  final asins = await ref.watch(queryItemResultProvider(page.param).future);
  final total = asins.length;
  final start = page.page * _kPageSize;
  final end = min(total, start + _kPageSize);
  final req = asins.sublist(start, end);
  final resp = await mws.batchGetAsinData(req, cancelToken: cancelToken);
  ref.keepAlive();
  return resp.data;
});

final asinDataAtIndex = Provider.autoDispose
    .family<AsyncValue<AsinData>, AsinDataIndexAtParam>((ref, index) {
  final offsetInPage = index.index % _kPageSize;
  final page = index.index ~/ _kPageSize;
  final param = AsinDataPageParam(param: index.param, page: page);
  // 何度も Exception が投げられるのを防ぐため、maintainState = true にする
  ref.keepAlive();
  return ref.watch(_asinDataPage(param)).whenData((value) {
    final data = value[offsetInPage];
    if (data.asin == "") {
      throw const AmazonItemNotFoundException("このマーケットでは販売できない商品です");
    }
    return data;
  });
});

class WordSearchPage extends StatelessWidget {
  const WordSearchPage({super.key});
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
  const _AppBar();

  static final _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final req = ref.watch(_currentQueryItemsRequest);
    final amazonRepository = ref.watch(amazonRepositoryProvider);

    final height = useState<double>(0);
    WidgetsBinding.instance.addPostFrameCallback((cb) {
      // build が完了した後に AppBar の高さを計算して設定、再描画する
      final obj = _appBarKey.currentContext?.findRenderObject();
      if (obj != null) {
        // ValueNotifier 内で値が同じなら set がスキップされるので、事前にチェックはしないでよい
        height.value = obj.paintBounds.height;
      }
    });

    void onSubmit(String value) {
      var trimmedValue = value.trim();
      if (trimmedValue.length > 64) {
        trimmedValue = trimmedValue.substring(0, 64);
      }
      if (trimmedValue != "") {
        if (req.query == trimmedValue) {
          // 変更がない場合は強制リロードする
          final _ = ref.refresh(queryItemResultProvider(req));
          return;
        }
        ref.read(_currentQueryItemsRequest.notifier).state =
            req.copyWith(query: trimmedValue);
        ref
            .read(wordSearchHistoryControllerProvider.notifier)
            .add(WordSearchHistory(keyword: trimmedValue));
      }
    }

    return SliverAppBar(
      title: Column(
        key: _appBarKey,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 0, 8),
            child: Row(
              children: [
                Expanded(
                  child: TypeAheadField(
                    controller: controller,
                    hideOnLoading: true,
                    builder: (context, controller, focusNode) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          hintText: "フリーワード検索",
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: controller.clear,
                          ),
                        ),
                        contextMenuBuilder: (
                          BuildContext context,
                          EditableTextState editableTextState,
                        ) {
                          if (SystemContextMenu.isSupported(context)) {
                            return SystemContextMenu.editableText(
                              editableTextState: editableTextState,
                            );
                          }
                          return AdaptiveTextSelectionToolbar.editableText(
                            editableTextState: editableTextState,
                          );
                        },
                        onSubmitted: onSubmit,
                      );
                    },
                    suggestionsCallback: (pattern) async {
                      if (pattern.isEmpty) {
                        return <String>[];
                      }
                      return amazonRepository.getSuggestion(pattern);
                    },
                    hideOnEmpty: true,
                    itemBuilder: (context, itemData) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(itemData),
                      );
                    },
                    onSelected: (value) {
                      controller.text = value;
                      onSubmit(value);
                      unfocus();
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final ret = await Navigator.push(
                      context,
                      WordSearchHistoryPage.route(),
                    );
                    if (ret != null) {
                      controller.text = ret;
                      ref.read(_currentQueryItemsRequest.notifier).state =
                          req.copyWith(query: ret);
                    }
                  },
                  icon: const Icon(Icons.history),
                ),
              ],
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
  const _Body();

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
