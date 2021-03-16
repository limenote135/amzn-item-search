import 'package:amasearch/controllers/item_controller.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/repository/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'geo.freezed.dart';

const _noItemText = "NG";

final _geoProvider = Provider((ref) => GeoRepository(ref.read));

final geoJanFutureProvider =
    FutureProvider.autoDispose.family<String, String>((ref, code) async {
  final geo = ref.read(_geoProvider);
  final resp = await geo.get(code);
  ref.maintainState = true;
  if (resp.jan == "") {
    return code;
  }
  return resp.jan;
});

final geoItemFutureProvider =
    FutureProvider.family<StateNotifierProvider<ItemController>, String>(
        (ref, code) async {
  final jan = await ref.read(geoJanFutureProvider(code).future);

  await ref.container.refresh(itemFutureProvider(jan));
  return ref.watch(itemFutureProvider(jan).future);
});

const _geoCodeLength = 7;

class GeoRepository {
  GeoRepository(this._read);

  final Reader _read;
  static const _baseURL = "https://bo.sedolist.info/sedoroid/geo/?CODE=";

  Future<GeoResponse> get(String value) async {
    final code = value.length > _geoCodeLength
        ? value.substring(1, 1 + _geoCodeLength)
        : value;

    final url = "$_baseURL$code";
    final result = await _read(dioProvider).get<String>(url);

    final body = result.data.toString();
    if (body == _noItemText) {
      return GeoResponse(code: code);
    }
    return GeoResponse(code: code, jan: body);
  }
}

@freezed
class GeoResponse with _$GeoResponse {
  const factory GeoResponse({
    required String code,
    @Default("") String jan,
  }) = _GeoResponse;
}
