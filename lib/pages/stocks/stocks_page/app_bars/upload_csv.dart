import 'package:amasearch/analytics/analytics.dart';
import 'package:amasearch/analytics/events.dart';
import 'package:amasearch/models/general_settings.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:amasearch/util/csv.dart';
import 'package:amasearch/util/formatter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'common.dart';

Future<bool> uploadCsv(
  WidgetRef ref,
  List<StockItem> itemList,
  GeneralSettings settings,
) async {
  final timestamp = DateTime.now().timestampFormat();
  final file = await createStockItemCsv(
    "StockList_$timestamp",
    itemList,
    settings,
  );
  final result = await Share.shareFilesWithResult(
    [file.absolute.path],
    subject: "仕入れ済み商品一覧_$timestamp",
  );
  resetState(ref);
  await ref
      .read(analyticsControllerProvider)
      .logSingleEvent(uploadListEventName);

  return result.status == ShareResultStatus.success;
}
