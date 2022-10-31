import 'package:amasearch/models/asin_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';

import 'constants.dart';

part 'keep_item.freezed.dart';
part 'keep_item.g.dart';

final currentKeepItemProvider =
    Provider<KeepItem>((_) => throw UnimplementedError());

@freezed
class KeepItem with _$KeepItem {
  @HiveType(typeId: keepItemTypeId)
  const factory KeepItem({
    @HiveField(0) required String id,
    @HiveField(1) required AsinData item,
    @HiveField(2) required String keepDate,
    @HiveField(3, defaultValue: "") @Default("") String memo,
  }) = _KeepItem;
}
