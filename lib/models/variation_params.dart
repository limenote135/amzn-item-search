import 'package:freezed_annotation/freezed_annotation.dart';

part 'variation_params.freezed.dart';

@freezed
class VariationPageParam with _$VariationPageParam {
  const factory VariationPageParam({
    required String asin,
    required int page,
  }) = _VariationPageParam;
}

@freezed
class VariationIndexAtParam with _$VariationIndexAtParam {
  const factory VariationIndexAtParam({
    required String asin,
    required int index,
  }) = _VariationIndexAtParam;
}
