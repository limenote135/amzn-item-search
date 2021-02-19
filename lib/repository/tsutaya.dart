import 'package:amasearch/controllers/item_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _tsutayaCodeLength = 16;

String getTsutayaJanCode(String code) {
  if (code.length != _tsutayaCodeLength) {
    return code;
  }
  return code.substring(2, code.length - 1);
}

final tsutayaItemFutureProvider =
    FutureProvider.family<StateNotifierProvider<ItemController>, String>(
        (ref, code) async {
  final jan = getTsutayaJanCode(code);
  await ref.container.refresh(itemFutureProvider(jan));
  return ref.watch(itemFutureProvider(jan).future);
});
