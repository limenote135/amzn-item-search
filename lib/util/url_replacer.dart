import 'package:amasearch/models/item.dart';
import 'package:flutter/material.dart';

const asinVariable = "{asin}";
const janVariable = "{jan}";
const titleVariable = "{title}";

String replaceUrl({@required String template, @required AsinData item}) {
  return template
      .replaceAll(asinVariable, item.asin)
      .replaceAll(janVariable, item.jan)
      .replaceAll(titleVariable, item.title);
}
