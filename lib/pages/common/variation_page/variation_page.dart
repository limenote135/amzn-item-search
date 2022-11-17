import 'dart:math';

import 'package:amasearch/models/asin_data.dart';
import 'package:amasearch/models/variation_params.dart';
import 'package:amasearch/pages/search/common/search_item_tile.dart';
import 'package:amasearch/pages/search/detail_page/detail_page.dart';
import 'package:amasearch/repository/mws.dart';
import 'package:amasearch/widgets/async_value_widget.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAsinProvider = Provider<String>((_) => throw UnimplementedError());

class VariationPage extends StatelessWidget {
  const VariationPage({super.key});

  static const String routeName = "/variation";

  static Route<void> route(String asin) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProviderScope(
        overrides: [
          currentAsinProvider.overrideWithValue(asin),
        ],
        child: const VariationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("バリエーション検索"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asin = ref.watch(currentAsinProvider);
    if (asin == "") {
      return const ListTile(
        title: Text("バリエーションはありません"),
      );
    }
    final variationAsyncValue = ref.watch(variationsFutureProvider(asin));
    return AsyncValueWidget<List<String>>(
      value: variationAsyncValue,
      data: (value) {
        return ListView.separated(
          itemBuilder: (context, index) {
            // final searchItem =
            //     SearchItem(searchDate: "", jan: "", asins: [value[index]]);

            return ProviderScope(
              overrides: [
                _currentIndexProvider.overrideWithValue(index),
                // currentAsinDataProvider.overrideWithValue(value[index]),
                // currentSearchDateProvider.overrideWithValue(null),
              ],
              // child: const SearchItemTile(),
              child: const _Tile(),
            );
          },
          separatorBuilder: (context, index) => const ThemeDivider(),
          itemCount: value.length,
        );
      },
    );
  }
}

final _currentIndexProvider = Provider<int>((_) => throw UnimplementedError());
const _kPageSize = 20;

final _variationPage = FutureProvider.autoDispose
    .family<List<AsinData>, VariationPageParam>((ref, param) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final mws = ref.watch(mwsRepositoryProvider);
  final asins = await ref.watch(variationsFutureProvider(param.asin).future);
  final total = asins.length;
  final start = param.page * _kPageSize;
  final end = min(total, start + _kPageSize);
  final req = asins.sublist(start, end);
  final resp = await mws.batchGetAsinData(req, cancelToken: cancelToken);
  ref.keepAlive();
  return resp.data;
});

final variationAtIndex = Provider.autoDispose
    .family<AsyncValue<AsinData>, VariationIndexAtParam>((ref, param) {
  final offsetInPage = param.index % _kPageSize;
  final page = param.index ~/ _kPageSize;
  final req = VariationPageParam(asin: param.asin, page: page);
  // 何度も Exception が投げられるのを防ぐため、maintainState = true にする
  ref.keepAlive();
  return ref.watch(_variationPage(req)).whenData((value) {
    return value[offsetInPage];
  });
});

class _Tile extends ConsumerWidget {
  const _Tile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asin = ref.watch(currentAsinProvider);
    final index = ref.watch(_currentIndexProvider);
    final req = VariationIndexAtParam(asin: asin, index: index);
    final variationAsyncValue = ref.watch(variationAtIndex(req));
    return AsyncValueListTileWidget(
      value: variationAsyncValue,
      errorInfo: [
        "VariationPage",
        "asin: $asin, index: $index",
      ],
      data: (value) => ProviderScope(
        overrides: [
          currentAsinDataProvider.overrideWithValue(value),
          currentSearchDateProvider.overrideWithValue(null),
        ],
        child: const _InkWell(child: SearchItemTile()),
      ),
    );
  }
}

class _InkWell extends HookConsumerWidget {
  const _InkWell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentAsinDataProvider);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          DetailPage.route(item, VariationPage.routeName),
        );
      },
      child: child,
    );
  }
}
