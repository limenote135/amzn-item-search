import 'package:amasearch/controllers/item_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:hooks_riverpod/all.dart';

final tsutayaItemFutureProvider =
    FutureProvider.family<StateNotifierProvider<ItemController>, String>(
        (ref, code) async {
  final length = code.length;
  if (length != 16) {
    return ref.watch(itemFutureProvider("$code").future);
  }

  final jan = code.substring(2, length-1);
  return ref.watch(itemFutureProvider(jan).future);
});
