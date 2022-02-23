import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_notes.freezed.dart';
part 'release_notes.g.dart';

@freezed
class ReleaseNotes with _$ReleaseNotes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReleaseNotes({
    required String version,
    required String text,
  }) = _ReleaseNotes;

  factory ReleaseNotes.fromJson(Map<String, dynamic> json) =>
      _$ReleaseNotesFromJson(json);
}
