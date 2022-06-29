// 仕入れ日のリスト
import 'package:amasearch/pages/stocks/stocks_page/provider.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final daysProvider = Provider((ref) {
  final items = ref.watch(filteredStockListProvider);
  return [
    ...{
      ...items.map((e) => DateTime.parse(e.purchaseDate).toLocal().dayFormat())
    }
  ];
});

// 実績シェア用に仕入れ日ごとに GlobalKey を作成
final captureKeyMapProvider = Provider((ref) {
  final days = ref.watch(daysProvider);
  final map = <String, GlobalKey>{};
  for (final day in days) {
    map[day] = GlobalKey();
  }
  return map;
});

// トータル仕入れ向けに GlobalKey を作成
final summaryKey = GlobalKey();
