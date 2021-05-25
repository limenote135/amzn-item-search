import 'dart:convert';
import 'dart:math';

import './euc_table.dart';

class EucJPDecoder extends Converter<List<int>, String> {
  @override
  String convert(input) {
    final result = <int>[];
    for (var i = 0; i < input.length; i++) {
      final c1 = input[i];
      if (c1 <= 0x7E) {
        // ASCII Compatible
        result.addAll(kEucTable[c1] ?? []);
      } else if (c1 == 0x8e) {
        // Hiragana
        final c2 = input[++i];
        result.addAll(kEucTable[(c1 << 8) + c2] ?? []);
      } else if (c1 == 0x8f) {
        // JIS X 0212
        final c2 = input[++i];
        final c3 = input[++i];
        result.addAll(kEucTable[(c1 << 16) + (c2 << 8) + c3] ?? []);
      } else {
        // JIS X 0208
        final c2 = input[++i];
        result.addAll(kEucTable[(c1 << 8) + c2] ?? []);
      }
    }
    return utf8.decode(result);
  }
}

class EucJPEncoder extends Converter<String, List<int>> {
  @override
  List<int> convert(String input) {
    final result = <int>[];
    for (var i = 0; i < input.length; i++) {
      final bytes = utf8.encode(input[i]);
      var value = 0;

      for (var i = 0; i < bytes.length; i++) {
        value += bytes[i] * pow(256, bytes.length - i - 1).toInt();
      }

      result.addAll(kUtfTable[value] ?? []);
    }
    return result;
  }
}

class EucJP extends Encoding {
  @override
  Converter<List<int>, String> get decoder => EucJPDecoder();

  @override
  Converter<String, List<int>> get encoder => EucJPEncoder();

  @override
  String get name => 'EUC-JP';
}
