import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/csv.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:share_plus/share_plus.dart';

Future<bool> uploadCsv(
  List<StockItem> itemList,
  GeneralSettings settings,
  CsvFormat type,
) async {
  final timestamp = DateTime.now().timestampFormat();
  final file = await createStockItemCsv(
    "StockList_${timestamp}_${type.name}",
    itemList,
    settings,
    type,
  );
  final result = await Share.shareFilesWithResult(
    [file.absolute.path],
    subject: "仕入れ済み商品一覧_${timestamp}_${type.name}",
  );

  return result.status == ShareResultStatus.success;
}
