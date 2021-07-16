import 'package:amasearch/models/search_item.dart';
import 'package:amasearch/util/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _tsutayaCodeLength = 16;

String getTsutayaJanCode(String code) {
  if (code.length != _tsutayaCodeLength) {
    return code;
  }
  return code.substring(2, code.length - 1);
}

final tsutayaItemFutureProvider =
    FutureProvider.family<SearchItem, String>((ref, code) async {
  final jan = getTsutayaJanCode(code);
  // ref.maintainState = true;
  return SearchItem(searchDate: currentTimeString(), jan: jan);
});
