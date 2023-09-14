import 'dart:async';
import 'dart:io';

import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/error_report.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:dartx/dartx_io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final stockItemForAsinProvider =
    Provider.autoDispose.family<List<StockItem>, String>((ref, asin) {
  final items = ref
      .watch(
        stockItemListControllerProvider
            .select((value) => value.where((e) => e.item.asin == asin)),
      )
      .toList();
  return items;
});

final stockItemListControllerProvider =
    StateNotifierProvider<StockItemListController, List<StockItem>>(
  StockItemListController.new,
);

class StockItemListController extends StateNotifier<List<StockItem>> {
  StockItemListController(this._ref, {List<StockItem>? state})
      : super(state ?? []) {
    _fetchAll();
  }

  static const _imageDirVariable = "\${imageDir}";

  static final _absPathRegexp = RegExp(r"/var/.+/Documents/images");

  static int _sortFunc(StockItem x, StockItem y) {
    return y.purchaseDate.compareTo(x.purchaseDate);
  }

  final Ref _ref;

  Future<void> _fetchAll() async {
    final imageDir = await _getImageDir();
    final box = _ref.read(stockItemBoxProvider);

    final invalidImageItem = <StockItem>[];

    final items = box.values.map((e) {
      final images = <String>[];
      for (final image in e.images) {
        var img = image;
        if (_absPathRegexp.hasMatch(img)) {
          // 絶対パスで保存してしまっているケースがあるので、相対パスに変換する
          // iOS ではアプリ更新時にパスが変わるので、FileNotFound になる
          // Android では変わらないのでセーフ
          img = img.replaceAll(_absPathRegexp, "\${imageDir}");
          invalidImageItem.add(e);
        }
        images.add(img.replaceAll(_imageDirVariable, imageDir.path));
      }
      return e.copyWith(images: images);
    }).toList();
    final data = items..sort(_sortFunc);
    state = data;

    for (final item in invalidImageItem) {
      final fixedItem = item.copyWith(
        images: item.images
            .map((e) => e.replaceAll(_absPathRegexp, "\${imageDir}"))
            .toList(),
      );
      unawaited(box.put(fixedItem.id, fixedItem));
    }
  }

  Future<Directory> _getImageDir() async {
    final docDir = await getApplicationDocumentsDirectory();
    final imageDir = docDir.subdir("images");
    return imageDir;
  }

  Future<void> add(StockItem item) async {
    final imageDir = await _getImageDir();
    // cache や一時ディレクトリに置かれているの、imageDir にコピーする
    final rawImages = copyImages(item.images, imageDir);
    final replacedImages = rawImages
        .map((e) => e.replaceAll(imageDir.path, _imageDirVariable))
        .toList();
    final rawItem = item.copyWith(images: rawImages);
    final replacedItem = item.copyWith(images: replacedImages);

    final box = _ref.read(stockItemBoxProvider);
    // 過去の日付で仕入れをする場合があるため、仕入後には再ソートする
    // state には画像が imageDir のフルパスになっているものを入れる
    state = [rawItem, ...state]..sort(_sortFunc);
    unawaited(box.put(item.id, replacedItem));

    if (replacedItem.images.any((element) => element.startsWith("/"))) {
      unawaited(
        recordError(
          "Saved absolute file path",
          StackTrace.current,
          information: replacedItem.images,
        ),
      );
    }
  }

  Future<void> update(StockItem item) async {
    final imageDir = await _getImageDir();
    final rawImages = copyImages(item.images, imageDir);
    final replacedImages = rawImages
        .map((e) => e.replaceAll(imageDir.path, _imageDirVariable))
        .toList();
    final rawItem = item.copyWith(images: rawImages);
    final replacedItem = item.copyWith(images: replacedImages);

    final oldItem = state.singleWhere((element) => element.id == item.id);

    final box = _ref.read(stockItemBoxProvider);
    // 仕入れ日を変更する場合があるため、再ソートする
    // state には画像が imageDir のフルパスになっているものを入れる
    state = [for (final i in state) i.id == item.id ? rawItem : i]
      ..sort(_sortFunc);
    unawaited(box.put(item.id, replacedItem));

    if (replacedItem.images.any((element) => element.startsWith("/"))) {
      unawaited(
        recordError(
          "Saved absolute file path",
          StackTrace.current,
          information: replacedItem.images,
        ),
      );
    }

    // 古い画像の削除
    final deleteTargets = oldItem.images
        .where((element) => !rawImages.contains(element))
        .toList();
    for (final img in deleteTargets) {
      final f = File(img);
      if (f.existsSync()) {
        unawaited(f.delete());
      }
    }
  }

  void remove(List<StockItem> targets) {
    if (targets.isEmpty) {
      return;
    }
    state = state.where((element) => !targets.contains(element)).toList();

    for (final t in targets) {
      for (final img in t.images) {
        final f = File(img);
        if (f.existsSync()) {
          unawaited(f.delete());
        }
      }
    }
    final box = _ref.read(stockItemBoxProvider);
    final keys = targets.map((e) => e.id);
    box.deleteAll(keys);
  }

  void removeAll() {
    final box = _ref.read(stockItemBoxProvider);
    for (final t in state) {
      for (final img in t.images) {
        final f = File(img);
        if (f.existsSync()) {
          unawaited(f.delete());
        }
      }
    }
    state = [];
    box.clear();
  }

  void setListingDate(List<StockItem> items, String date) {
    final box = _ref.read(stockItemBoxProvider);
    final itemMap = <String, StockItem>{};
    for (final e in items) {
      itemMap[e.id] = e.copyWith(listingDate: date);
    }
    state = [
      for (final e in state) itemMap.containsKey(e.id) ? itemMap[e.id]! : e,
    ];
    box.putAll(itemMap);
  }

  List<String> copyImages(List<String> rawImages, Directory dest) {
    if (!dest.existsSync()) {
      dest.createSync(recursive: true);
    }
    final result = <String>[];
    for (final img in rawImages) {
      // 既に dest にあるものはそのままにする
      if (img.startsWith(dest.path)) {
        result.add(img);
        continue;
      }
      final title = '${DateTime.now().microsecondsSinceEpoch}.jpg';
      final path = "${dest.path}/$title";
      File(img).copySync(path);
      result.add(path);
    }
    return result;
  }
}
