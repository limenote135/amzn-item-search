import 'package:amasearch/repository/mws.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_params.freezed.dart';

@freezed
class AsinDataPageParam with _$AsinDataPageParam {
  const factory AsinDataPageParam({
    required ListMatchingProductRequest param,
    required int page,
  }) = _AsinDataPageParam;
}

@freezed
class AsinDataIndexAtParam with _$AsinDataIndexAtParam {
  const factory AsinDataIndexAtParam({
    required ListMatchingProductRequest param,
    required int index,
  }) = _AsinDataIndexAtParam;
}
