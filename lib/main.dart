import 'package:amasearch/models/constants.dart';
import 'package:amasearch/models/enums/fulfillment_channel.dart';
import 'package:amasearch/models/enums/item_condition.dart';
import 'package:amasearch/models/enums/item_sub_condition.dart';
import 'package:amasearch/models/enums/search_type.dart';
import 'package:amasearch/models/enums/used_sub_condition.dart';
import 'package:amasearch/models/fee_info.dart';
import 'package:amasearch/models/item.dart';
import 'package:amasearch/models/item_price.dart';
import 'package:amasearch/models/stock_item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ItemAdapter())
    ..registerAdapter(AsinDataAdapter())
    ..registerAdapter(ItemPricesAdapter())
    ..registerAdapter(ItemPriceAdapter())
    ..registerAdapter(PriceDetailAdapter())
    ..registerAdapter(FeeInfoAdapter())
    ..registerAdapter(StockItemAdapter())
    ..registerAdapter(FulfillmentChannelAdapter())
    ..registerAdapter(ItemConditionAdapter())
    ..registerAdapter(ItemSubConditionAdapter())
    ..registerAdapter(SearchTypeAdapter())
    ..registerAdapter(UsedSubConditionAdapter());

  // await deleteBoxes();
  await Hive.openBox<Item>(searchItemBoxName);
  await Hive.openBox<StockItem>(stockItemBoxName);

  // TODO:
  Intl.defaultLocale = 'ja_JP';
  runApp(ProviderScope(child: MyApp()));
}

Future<void> deleteBoxes() async {
  await Hive.deleteBoxFromDisk(searchItemBoxName);
  await Hive.deleteBoxFromDisk(stockItemBoxName);
}
