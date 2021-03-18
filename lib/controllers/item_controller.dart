import 'dart:typed_data';

import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/hive_provider.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final itemControllerProvider =
    StateNotifierProvider.family<ItemController, SearchItem>(
        (ref, item) => ItemController(ref.read, item));

class ItemController extends StateNotifier<SearchItem> {
  ItemController(this._read, SearchItem item) : super(item);

  static final Function eq = const ListEquality<int>().equals;

  final Reader _read;

  void save() {
    final box = _read(searchItemBoxProvider);
    // ignore: cascade_invocations
    box.put(state.searchDate, state);
  }

  void setImageBinary(String asin, Uint8List data) {
    final targets = state.asins.where((element) => element.asin == asin);
    if (targets.isEmpty) {
      print("No items in ${state.jan} (ASIN: $asin)");
      return;
    }

    final target = targets.single;

    if (eq(target.imageData, data) == true) {
      print("No need to update");
      return;
    }

    state = state.copyWith(asins: [
      for (var item in state.asins)
        if (item.asin == target.asin) item.copyWith(imageData: data) else item
    ]);
    save();
    print("update image data");
  }
}
