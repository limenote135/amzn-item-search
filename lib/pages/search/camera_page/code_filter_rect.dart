import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter/material.dart';

class CodeFilterRect extends RectOfInterest {
  const CodeFilterRect();

  @override
  Rect rect(Rect previewWidgetRect) {
    final width = previewWidgetRect.width;
    // 中心から高さの 40% 分がスキャン対象範囲
    final height = previewWidgetRect.height * 0.4;
    return Rect.fromCenter(
      center: previewWidgetRect.center,
      width: width,
      height: height,
    );
  }
}
