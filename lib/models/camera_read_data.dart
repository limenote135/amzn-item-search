import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_read_data.freezed.dart';

@freezed
class CameraReadData with _$CameraReadData {
  const factory CameraReadData({
    required String code,
    required DateTime readAt,
  }) = _CameraReadData;
}
