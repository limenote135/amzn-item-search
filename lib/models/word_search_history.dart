import 'package:amasearch/models/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'word_search_history.freezed.dart';
part 'word_search_history.g.dart';

@freezed
class WordSearchHistory with _$WordSearchHistory {
  @HiveType(typeId: wordSearchHistoryTypeId)
  const factory WordSearchHistory({
    @HiveField(0) required String keyword,
  }) = _WordSearchHistory;
}
