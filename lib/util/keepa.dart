import 'package:amasearch/models/enums/keepa_show_period.dart';
import 'package:amasearch/models/keepa_settings.dart';

String createKeepaUrl(
  String asin,
  KeepaSettings settings, {
  String width = "300",
  String height = "150",
  String key = "",
}) {
  final params = <String>[
    "new=${settings.showNew ? "1" : "0"}",
    "used=${settings.showUsed ? "1" : "0"}",
    "amazon=${settings.showAmazon ? "1" : "0"}",
    "bb=${settings.showBuyBox ? "1" : "0"}",
    "fba=${settings.showFba ? "1" : "0"}",
    "range=${settings.period.toValue()}",
  ];
  var baseURL = "https://graph.keepa.com/graphimage.png";
  if (key.isNotEmpty) {
    params.add("key=$key");
    baseURL = "https://api.keepa.com/graphimage";
  }
  final u = "$baseURL?"
      "asin=$asin&domain=jp&width=$width&height=$height&salesrank=1&"
      "${params.join("&")}${settings.extraParam}";
  return u;
}
