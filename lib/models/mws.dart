import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';
import 'item_price.dart';

part 'mws.freezed.dart';
part 'mws.g.dart';

@freezed
class GetProductByIdResponse with _$GetProductByIdResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetProductByIdResponse({
    required String jan,
    required List<AsinData> items,
  }) = _GetProductByIdResponse;

  factory GetProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductByIdResponseFromJson(json);
}

@freezed
class GetProductPricesResponse with _$GetProductPricesResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetProductPricesResponse({
    required ItemPrices prices,
  }) = _GetProductPricesResponse;

  factory GetProductPricesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductPricesResponseFromJson(json);
}

@freezed
class ListMatchingProductRequest with _$ListMatchingProductRequest {
  const factory ListMatchingProductRequest({
    required String query,
    required String category,
  }) = _ListMatchingProductRequest;
}

@freezed
class ListMatchingProductResponse with _$ListMatchingProductResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ListMatchingProductResponse({
    required List<AsinData> items,
  }) = _ListMatchingProductResponse;

  factory ListMatchingProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMatchingProductResponseFromJson(json);
}
