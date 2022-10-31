import 'package:amasearch/models/asin_data.dart';
import 'package:convert/convert.dart';
import 'package:euc/euc.dart';

import 'variable_format.dart';

final _encoder = EucJPEncoder();

String replaceUrl({required String template, required AsinData item}) {
  var title = item.title;
  if (template.contains("aucfan.com")) {
    // オークファンはタイトルを EUC エンコードするので特別対応
    final eucText = _encoder.convert(item.title);
    title = hex.encode(eucText);
  }
  final url = template
      .replaceAll(asinVariable, item.asin)
      .replaceAll(janVariable, item.jan)
      .replaceAll(titleVariable, title)
      .replaceAll(modelVariable, item.model);

  return Uri.encodeFull(url);
}
