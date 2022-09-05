import 'package:amasearch/models/asin_data.dart';

import 'variable_format.dart';

String replaceUrl({required String template, required AsinData item}) {
  final url = template
      .replaceAll(asinVariable, item.asin)
      .replaceAll(janVariable, item.jan)
      .replaceAll(titleVariable, item.title)
      .replaceAll(modelVariable, item.model);

  return Uri.encodeFull(url);
}
