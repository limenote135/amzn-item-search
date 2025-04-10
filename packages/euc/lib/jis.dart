import 'dart:convert';
import 'dart:math';

import './jis_table.dart';

class JISDecoder extends Converter<List<int>, String> {
  @override
  String convert(List<int> input) {
    final result = <int>[];
    for (var i = 0; i < input.length; i++) {
      final c1 = input[i];
      if (c1 <= 0x7F) {
        // ASCII Compatible (partially)
        result.addAll(kJisTable[c1] ?? []);
      } else if (c1 >= 0xa1 && c1 <= 0xdf) {
        // Half-width Hiragana
        result.addAll(kJisTable[c1] ?? []);
      } else if (c1 >= 0x81 && c1 <= 0x9f) {
        // JIS X 0208
        final c2 = input[++i];
        result.addAll(kJisTable[(c1 << 8) + c2] ?? []);
      } else if (c1 >= 0xe0 && c1 <= 0xef) {
        // JIS X 0208
        final c2 = input[++i];
        result.addAll(kJisTable[(c1 << 8) + c2] ?? []);
      } else {
        // Unknown
        result.addAll([]);
      }
    }
    return utf8.decode(result);
  }
}

class JISEncoder extends Converter<String, List<int>> {
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

class ShiftJIS extends Encoding {
  @override
  Converter<List<int>, String> get decoder => JISDecoder();

  @override
  Converter<String, List<int>> get encoder => JISEncoder();

  @override
  String get name => 'Shift_JIS';
}
